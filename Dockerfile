FROM python:3.11-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Устанавливаем зависимости
RUN pip install --no-cache-dir django pillow gunicorn whitenoise psycopg2-binary

# Копируем проект
COPY . .

# Создаём папки для статики
RUN mkdir -p /app/staticfiles /app/media

# Команда запуска (миграции + сервер)
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]