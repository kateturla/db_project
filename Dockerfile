# Используем официальный образ Python
FROM python:3.9-slim

# Устанавливаем необходимые пакеты, включая SQLite
RUN apt-get update && apt-get install -y sqlite3 && rm -rf /var/lib/apt/lists/*

# Устанавливаем рабочую директорию в контейнере
WORKDIR /app

# Копируем файлы проекта в контейнер
COPY . /app/

# Устанавливаем права на файл базы данных
RUN chmod +x /app/2_пункт_sqlite_дамп.db

# Определяем команду для запуска SQLite с указанной базой данных
CMD ["sqlite3", "/app/sqlite_dump.db"]
