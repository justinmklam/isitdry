FROM python:3.8

WORKDIR /app/

# Install Poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

# Copy files
COPY . /app/
ENV PYTHONPATH=/app

RUN poetry install --no-dev

CMD ["uvicorn", "isitdry.main:app", "--host", "0.0.0.0", "--port", "8080"]
