FROM python:3.8

WORKDIR /app/

# Install Poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

# Copy requirements so they can be cached
COPY poetry.lock pyproject.toml ./
RUN poetry install --no-dev

COPY . /app/
ENV PYTHONPATH=/app

CMD ["uvicorn", "isitdry.main:app", "--host", "0.0.0.0", "--port", "8080"]
