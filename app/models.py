from app import db
from datetime import datetime
from flask_login import UserMixin
from werkzeug.security import generate_password_hash, check_password_hash

class User(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50), unique=True, nullable=False)
    password_hash = db.Column(db.String(256))
    is_admin = db.Column(db.Boolean, default=False)

    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)
    

article_tag = db.Table(
    "article_tag",
    db.Column("article_id", db.Integer, db.ForeignKey("article.id", ondelete="CASCADE")),
    db.Column("tag_id", db.Integer, db.ForeignKey("tag.id", ondelete="CASCADE"))
)

class Article(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(255), nullable=False)
    authors = db.Column(db.Text)
    year = db.Column(db.Integer)
    journal = db.Column(db.String(100))
    doi = db.Column(db.String(100))
    url = db.Column(db.String(255))
    abstract = db.Column(db.Text)
    image = db.Column(db.String(255))
    approved = db.Column(db.Boolean, default=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)
    tags = db.relationship("Tag", secondary=article_tag, back_populates="articles")
    bib_file = db.Column(db.String(256), nullable=True)
    
class Tag(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), unique=True, nullable=False)
    category_id = db.Column(db.Integer, db.ForeignKey("category.id", ondelete="CASCADE"))
    articles = db.relationship("Article", secondary=article_tag, back_populates="tags")
    
class Category(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), unique=True, nullable=False)
    tags = db.relationship("Tag", backref="category", lazy="joined", cascade="all, delete-orphan")
