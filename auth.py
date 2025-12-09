from flask_login import login_user, logout_user
from app.models import User

def login(username, password):
    """Авторизация пользователя"""
    user = User.query.filter_by(username=username).first()
    if user and user.check_password(password):
        login_user(user)
        return True
    return False

def logout():
    """Выход пользователя"""
    logout_user()