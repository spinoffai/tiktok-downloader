FROM python:3.11

WORKDIR /app

COPY pyproject.toml poetry.lock ./
RUN pip install poetry gunicorn
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev

COPY . .

ENTRYPOINT [ "gunicorn", "tiktok_downloader.server:app" ]