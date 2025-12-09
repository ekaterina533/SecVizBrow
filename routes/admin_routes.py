from flask import (
    Blueprint, render_template, redirect, url_for, flash, jsonify,
    request, current_app
)
from flask_login import login_required, current_user
from werkzeug.utils import secure_filename
from functools import wraps
from sqlalchemy.orm import joinedload
import os
import uuid
import re
from app.models import Article, Tag, Category, db
from app.forms import (
    ArticleEditForm,
    BibUploadForm,
    TagForm,
    CategoryForm
)
from app.bibtex_parser import parse_bibtex
from werkzeug.datastructures import FileStorage

admin_bp = Blueprint("admin", __name__)

def admin_required(f):
    @wraps(f)
    def wrapper(*args, **kwargs):
        if not current_user.is_admin:
            flash("Доступ запрещён", "error")
            return redirect(url_for("main.index"))
        return f(*args, **kwargs)
    return wrapper

def get_upload_folder():
    """Возвращает абсолютный путь к папке static/uploads"""
    folder = os.path.join(current_app.root_path, "static", "uploads", "bibs")
    os.makedirs(folder, exist_ok=True)
    return folder

@admin_bp.route("/edit-article/<int:id>", methods=["GET", "POST"])
@admin_bp.route("/edit-article", defaults={"id": None}, methods=["GET", "POST"])
@login_required
@admin_required
def edit_article(id):
    is_edit = id is not None
    article = Article.query.get(id) if is_edit else Article()

    if is_edit and not article:
        flash("Статья не найдена", "danger")
        return redirect(url_for("admin.admin_panel"))


    form = ArticleEditForm(obj=article)
    categories = Category.query.options(joinedload(Category.tags)).all()
    form.tags.choices = [(tag.id, tag.name) for category in categories for tag in category.tags]

    if request.method == "POST":
        approved = request.form.get("approved") == "1"
        
        # Проверка изображения только при публикации
        if approved and not article.image and not form.image.data:
            flash("Для публикации статьи необходимо загрузить изображение", "danger")
            return redirect(url_for('admin.edit_article', id=id) if is_edit else url_for('admin.edit_article'))
                
        if form.validate_on_submit():
            if not is_edit and not form.image.data:
                flash("Для публикации статьи необходимо загрузить изображение", "danger")
                return redirect(url_for('admin.edit_article'))

            approved = request.form.get("approved") == "1"
            if approved and not article.image and not form.image.data:
                flash("Для публикации статьи необходимо загрузить изображение", "danger")
                return redirect(url_for('admin.edit_article', id=id))
                                
            data = form.data.copy()
            data.pop("tags", None)
            data.pop("new_category", None)
            data.pop("new_tag", None)
            data.pop("image", None)
            data.pop("approved", None)

            for key, value in data.items():
                setattr(article, key, value)
            
            # Установка approved из скрытого поля
            approved_raw = request.form.get("approved")
            article.approved = approved_raw == "1"

            # Основные теги из чекбоксов
            selected_tag_ids = list(map(int, request.form.getlist("tags")))

            # Обработка новых категории и тега
            new_category_name = (form.new_category.data or "").strip()
            new_tag_name = (form.new_tag.data or "").strip()

            if new_category_name and new_tag_name:
                # Найти или создать категорию
                category = Category.query.filter_by(name=new_category_name).first()
                if not category:
                    category = Category(name=new_category_name)
                    db.session.add(category)
                    db.session.flush()  # получаем ID категории без коммита

                # Проверить, есть ли уже такой тег в этой категории
                existing_tag = Tag.query.filter_by(name=new_tag_name, category_id=category.id).first()
                if not existing_tag:
                    new_tag = Tag(name=new_tag_name, category_id=category.id)
                    db.session.add(new_tag)
                    db.session.flush()
                    selected_tag_ids.append(new_tag.id)
                else:
                    selected_tag_ids.append(existing_tag.id)

            # Привязка тегов
            article.tags = Tag.query.filter(Tag.id.in_(selected_tag_ids)).all()

            # Обработка изображения
            image_file = form.image.data
            if image_file and isinstance(image_file, FileStorage) and image_file.filename:
                filename = secure_filename(image_file.filename)
                filepath = os.path.join(current_app.config["UPLOAD_FOLDER"], filename)
                image_file.save(filepath)

                # Удаляем старое изображение
                if is_edit and article.image:
                    old_path = os.path.join(current_app.config["UPLOAD_FOLDER"], article.image)
                    if os.path.exists(old_path):
                        os.remove(old_path)

                article.image = filename

            # Сохраняем изменения
            db.session.add(article)
            db.session.commit()

            flash("Статья сохранена", "success")
            return redirect(url_for("admin.edit_article", id=article.id))

    elif request.method == "GET":
        form = ArticleEditForm(obj=article)
        form.tags.data = [tag.id for tag in article.tags]

    return render_template(
        "edit_article.html",
        form=form,
        article=article,
        is_edit=is_edit,
        categories=categories
    )

@admin_bp.route("/panel")
@login_required
@admin_required
def admin_panel():
    page = request.args.get("page", 1, type=int)
    articles = Article.query.options(joinedload(Article.tags)) \
        .order_by(Article.updated_at.desc()) \
        .paginate(page=page, per_page=10)

    form = BibUploadForm()
    return render_template("admin_panel.html", articles=articles, form=form)

@admin_bp.route("/delete-article/<int:id>", methods=["POST"])
@login_required
@admin_required
def delete_article(id):
    article = Article.query.get_or_404(id)
    try:
        if article.image:
            image_path = os.path.join(get_upload_folder(), article.image)
            if os.path.exists(image_path):
                os.remove(image_path)
        db.session.delete(article)
        db.session.commit()
        flash("Статья удалена!", "success")
    except Exception as e:
        db.session.rollback()
        flash(f"Ошибка: {str(e)}", "error")
    return redirect(url_for("admin.admin_panel"))

def sanitize_filename(text):
    """Преобразует строку в безопасное имя файла"""
    text = re.sub(r"[^\w\s-]", "", text)      # удаляем спецсимволы
    text = re.sub(r"\s+", "_", text)          # пробелы в "_"
    return text.strip("_")[:50] or uuid.uuid4().hex  # ограничим длину

# @admin_bp.route("/import-bib", methods=["GET", "POST"])
# @login_required
# @admin_required
# def import_bib():
#     form = BibUploadForm()
#     if form.validate_on_submit():
#         file = request.files["bib_file"]
#         if file.filename == "":
#             flash("Не выбран файл", "error")
#             return redirect(url_for("admin.admin_panel"))

#         try:
#             filename = secure_filename(file.filename)
#             upload_folder = get_upload_folder()
#             filepath = os.path.join(upload_folder, filename)
#             file.save(filepath)

#             with open(filepath, "r", encoding="utf-8") as f:
#                 bibtex_content = f.read()

#             articles_data = parse_bibtex(bibtex_content)
#             for data in articles_data:
#                 article = Article(
#                     title=data.get("title", ""),
#                     authors=data.get("authors", ""),
#                     year=int(data["year"]) if data.get("year", "").isdigit() else None,
#                     journal=data.get("journal", ""),
#                     doi=data.get("doi", ""),
#                     url=data.get("url", ""),
#                     abstract=data.get("abstract", "")
#                 )

#                 title_part = sanitize_filename(data.get("title", ""))
#                 authors_part = sanitize_filename(data.get("authors", "").split(";")[0])
#                 bib_filename = f"{title_part}_{authors_part or 'unknown'}_{uuid.uuid4().hex[:8]}.bib"
#                 bib_path = os.path.join(upload_folder, bib_filename)

#                 with open(bib_path, "w", encoding="utf-8") as bib_file:
#                     bib_file.write(data["raw_bib"])

#                 article.bib_file = bib_filename
#                 db.session.add(article)

#             db.session.commit()
#             flash(f"Импортировано {len(articles_data)} статей", "success")

#         except Exception as e:
#             db.session.rollback()
#             flash(f"Ошибка парсинга: {str(e)}", "error")

#         finally:
#             if os.path.exists(filepath):
#                 os.remove(filepath)

#         return redirect(url_for("admin.admin_panel"))

@admin_bp.route("/import-bib", methods=["GET", "POST"])
@login_required
@admin_required
def import_bib():
    form = BibUploadForm()
    if form.validate_on_submit():
        files = request.files.getlist("bib_files")  # Получаем список файлов
        
        if not files or files[0].filename == "":
            flash("Не выбраны файлы", "error")
            return redirect(url_for("admin.admin_panel"))

        total_imported = 0
        total_files = len(files)
        upload_folder = get_upload_folder()

        for file in files:
            if file.filename == "":
                continue
                
            try:
                filename = secure_filename(file.filename)
                temp_filepath = os.path.join(upload_folder, f"temp_{uuid.uuid4().hex}_{filename}")
                file.save(temp_filepath)

                # Чтение и парсинг BibTeX
                with open(temp_filepath, "r", encoding="utf-8") as f:
                    bibtex_content = f.read()

                articles_data = parse_bibtex(bibtex_content)
                file_imported = 0

                for data in articles_data:
                    # Проверяем, существует ли уже статья с таким DOI или названием
                    existing_article = None
                    if data.get("doi"):
                        existing_article = Article.query.filter_by(doi=data.get("doi")).first()
                    
                    if not existing_article and data.get("title"):
                        existing_article = Article.query.filter(
                            db.func.lower(Article.title) == data.get("title", "").lower()
                        ).first()

                    if existing_article:
                        # Можно обновить существующую статью или пропустить
                        flash(f"Статья '{data.get('title', '')}' уже существует, пропущена", "warning")
                        continue

                    # Создаем новую статью
                    article = Article(
                        title=data.get("title", ""),
                        authors=data.get("authors", ""),
                        year=int(data["year"]) if data.get("year", "").isdigit() else None,
                        journal=data.get("journal", ""),
                        doi=data.get("doi", ""),
                        url=data.get("url", ""),
                        abstract=data.get("abstract", ""),
                        approved=False  # Новые статьи не одобрены по умолчанию
                    )

                    # Создаем Bib файл для статьи
                    title_part = sanitize_filename(data.get("title", ""))
                    authors_part = sanitize_filename(data.get("authors", "").split(";")[0])
                    bib_filename = f"{title_part}_{authors_part or 'unknown'}_{uuid.uuid4().hex[:8]}.bib"
                    bib_path = os.path.join(upload_folder, bib_filename)

                    with open(bib_path, "w", encoding="utf-8") as bib_file:
                        bib_file.write(data["raw_bib"])

                    article.bib_file = bib_filename
                    db.session.add(article)
                    file_imported += 1
                    total_imported += 1

                # Удаляем временный файл
                if os.path.exists(temp_filepath):
                    os.remove(temp_filepath)

                flash(f"Файл '{filename}': импортировано {file_imported} статей", "info")

            except Exception as e:
                flash(f"Ошибка при обработке файла '{file.filename}': {str(e)}", "error")
                # Продолжаем обработку следующих файлов

        try:
            db.session.commit()
            flash(f"Успешно! Импортировано {total_imported} статей из {total_files} файлов", "success")
        except Exception as e:
            db.session.rollback()
            flash(f"Ошибка базы данных: {str(e)}", "error")

        return redirect(url_for("admin.admin_panel"))

    return render_template("admin_panel.html", form=form)

@admin_bp.route("/api/category", methods=["POST"])
def create_category():
    data = request.get_json()
    name = data.get("name", "").strip()
    if not name:
        return jsonify({"error": "Имя категории обязательно"}), 400
    category = Category(name=name)
    db.session.add(category)
    db.session.commit()
    return jsonify({"id": category.id, "name": category.name})

@admin_bp.route("/api/category/<int:category_id>", methods=["DELETE"])
def delete_category(category_id):
    category = Category.query.get_or_404(category_id)
    db.session.delete(category)
    db.session.commit()
    return jsonify({"success": True})

@admin_bp.route("/api/tag", methods=["POST"])
def create_tag():
    data = request.get_json()
    name = data.get("name", "").strip()
    category_id = data.get("category_id")
    if not name or not category_id:
        return jsonify({"error": "Имя тега и ID категории обязательны"}), 400
    tag = Tag(name=name, category_id=category_id)
    db.session.add(tag)
    db.session.commit()
    return jsonify({"id": tag.id, "name": tag.name})

@admin_bp.route("/api/tag/<int:tag_id>", methods=["DELETE"])
def delete_tag(tag_id):
    tag = Tag.query.get_or_404(tag_id)
    db.session.delete(tag)
    db.session.commit()
    return jsonify({"success": True})
