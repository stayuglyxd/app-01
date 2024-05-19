Dockerfile
# Используйте официальный образ Nginx как базовый
FROM nginx:latest

# Копируйте файлы конфигурации или статические файлы при необходимости
# COPY ./default.conf /etc/nginx/conf.d/default.conf
# COPY static-html-directory /usr/share/nginx/html

# Порт, который будет открыт контейнером
EXPOSE 80

# Запуск Nginx в фоновом режиме
CMD ["nginx", "-g", "daemon off;"]
