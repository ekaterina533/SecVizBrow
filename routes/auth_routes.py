from flask import Blueprint, render_template, redirect, url_for, flash
from flask_login import login_user, logout_user
from app.forms import LoginForm
from app.models import User

auth_bp = Blueprint("auth", __name__)

@auth_bp.route("/login", methods=["GET", "POST"])
def login():
    """Страница входа"""
    form = LoginForm()
    if form.validate_on_submit():
        user = User.query.filter_by(username=form.username.data).first()
        if user and user.check_password(form.password.data):
            login_user(user)
            return redirect(url_for("admin.admin_panel"))
        flash("Неверный логин или пароль", "error")
    return render_template("auth_admin.html", form=form)

@auth_bp.route("/logout")
def logout():
    """Выход из системы"""
    logout_user()
    flash("Вы успешно вышли!", "info")
    return redirect(url_for("main.index"))