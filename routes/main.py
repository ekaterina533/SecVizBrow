from flask import Blueprint, render_template, request, send_from_directory, abort, current_app
from app.models import Article, Tag, Category
from app import db
import os

main_bp = Blueprint("main", __name__)

@main_bp.route("/")
def index():
    page = request.args.get("page", 1, type=int)
    selected_tags = request.args.getlist("tags")
    search_query = request.args.get("q", "").strip()

    query = Article.query.filter_by(approved=True)

    if selected_tags:
        query = query.join(Article.tags).filter(Tag.name.in_(selected_tags)).distinct()

    if search_query:
        search = f"%{search_query.lower()}%"
        query = query.filter(
            db.or_(
                db.func.lower(Article.title).like(search),
                db.func.lower(Article.abstract).like(search),
                db.func.lower(Article.authors).like(search),
                db.func.lower(Article.journal).like(search)
            )
        )

    articles = query.order_by(Article.created_at.desc()).paginate(page=page, per_page=42)
    categories = Category.query.options(db.joinedload(Category.tags)).all()
    total_articles = query.count()
    last_updated = db.session.query(db.func.max(Article.updated_at)).scalar()

    return render_template(
        "index.html",
        articles=articles,
        categories=categories,
        total_articles=total_articles,
        last_updated=last_updated,
        selected_tags=selected_tags,
        search_query=search_query,
    )

@main_bp.route("/download_bib/<int:article_id>")
def download_bib(article_id):
    article = Article.query.get_or_404(article_id)
    if not article.bib_file:
        abort(404)

    bib_folder = os.path.join(current_app.root_path, "static", "uploads", "bibs")
    return send_from_directory(bib_folder, article.bib_file, as_attachment=True)
