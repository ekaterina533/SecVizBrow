1. Создать и активировать виртуальное окружение
Коннектор для бд работает только на linux
python3 -m venv env
source env/bin/activate
Окружение в папке удалить
2. Установить зависимости
3. Настроить бд
В файле config.py изменить
SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://admin:210411@localhost/secviz'
пользователь - пароль - имя бд
4. Инициализация базы данных
Если появятся конфликты удалить папку migrations
flask db init         # однократно, если нет папки migrations
flask db migrate -m "Initial migration"
flask db upgrade
5. Создание пользователя (если не установится dumb)
flask shell
-from app import db
-from app.models import User
-from werkzeug.security import generate_password_hash
-admin = User(username='Admin', password_hash=generate_password_hash('184713Ad'), is_admin=True)
-db.session.add(admin)
-db.session.commit()
6. Запуск 
flask run