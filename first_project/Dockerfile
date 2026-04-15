FROM python:3.11-slim

WORKDIR /app

# Копируем requirements.txt из корня
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt gunicorn whitenoise psycopg2-binary

# Копируем весь код из папки first_project
COPY first_project/ .

# Собираем статику
RUN python manage.py collectstatic --noinput

EXPOSE 8000

CMD ["gunicorn", "first_project.wsgi:application", "--bind", "0.0.0.0:8000"]