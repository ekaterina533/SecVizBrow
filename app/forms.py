from wtforms import IntegerField, validators
from wtforms import BooleanField
from flask_wtf import FlaskForm
from wtforms import (
    StringField, 
    PasswordField, 
    SubmitField, 
    SelectMultipleField, 
    FileField, 
    TextAreaField,
    MultipleFileField
)
from wtforms.validators import DataRequired
from flask_wtf.file import FileAllowed
from wtforms import SelectField

class LoginForm(FlaskForm):
    username = StringField("Логин", validators=[DataRequired()])
    password = PasswordField("Пароль", validators=[DataRequired()])
    submit = SubmitField("Войти")

class BibUploadForm(FlaskForm):
    bib_files = MultipleFileField("BibTeX файлы", validators=[
        DataRequired(),
        FileAllowed(["bib"], "Только .bib файлы!")
    ])
    submit = SubmitField("Импорт")

class ArticleEditForm(FlaskForm):
    title = StringField("Название", validators=[DataRequired()])
    authors = StringField("Авторы")
    year = IntegerField("Год", validators=[validators.Optional()])
    journal = StringField("Журнал")
    doi = StringField("DOI")
    url = StringField("URL")
    abstract = TextAreaField("Аннотация")
    #изменения
    image = FileField("Изображение", validators=[
        FileAllowed(["jpg", "png", "jpeg", "gif"], "Только изображения (JPG, PNG, JPEG, GIF)!")
    ])
    #изменения
    tags = SelectMultipleField("Теги", coerce=int)
    approved = BooleanField("Одобрено")
    # Поля для создания тегов (только при добавлении)
    new_tag = StringField("Новый тег")
    new_category = StringField("Новая категория")
    submit = SubmitField("Сохранить")

class TagForm(FlaskForm):
    name = StringField("Название тега", validators=[DataRequired()])
    category = SelectField("Категория", coerce=int, validators=[DataRequired()])
    submit = SubmitField("Создать")
    
class CategoryForm(FlaskForm):
    name = StringField("Название категории", validators=[DataRequired()])
    submit = SubmitField("Создать")