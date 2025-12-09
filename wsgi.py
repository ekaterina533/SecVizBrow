from app import create_app
import os

# Создаем приложение
app = create_app()

if __name__ == "__main__":
    app.run()