FROM python:3.8-slim

# Установка зависимостей
COPY requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt

# Копирование исходного кода приложения
COPY . /app

# Запуск приложения
EXPOSE 5000
CMD ["python", "app.py"]
