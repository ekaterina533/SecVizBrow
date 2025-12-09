from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from flask_migrate import Migrate
from datetime import datetime

db = SQLAlchemy()
login_manager = LoginManager()
migrate = Migrate()

def create_app():
    app = Flask(__name__)
    app.config.from_object('app.config.Config')
    
    db.init_app(app)
    login_manager.init_app(app)
    migrate.init_app(app, db)

    # Регистрация Blueprints
    from app.routes.main import main_bp
    from app.routes.admin_routes import admin_bp
    from app.routes.auth_routes import auth_bp
    
    app.register_blueprint(main_bp)
    app.register_blueprint(admin_bp, url_prefix="/admin")
    app.register_blueprint(auth_bp)
    
    #Год
    @app.context_processor
    def inject_year():
        return {"current_year": datetime.now().year}

    # Загрузчик пользователя
    @login_manager.user_loader
    def load_user(user_id):
        from app.models import User
        return User.query.get(int(user_id))
    
    @app.template_filter('datetimeformat')
    def datetimeformat(value, format='%d.%m.%Y %H:%M'):
        if value is None:
            return ""
        return value.strftime(format)
    
    return app