.PHONY: install lint format test build run shell

install:
	poetry install
	poetry env info

lint:
	poetry run black . --check
	poetry run isort . --check-only
	poetry run mypy .

format:
	poetry run black .
	poetry run isort

test:
	poetry run pytest

build:
	@docker-compose build

run:
	@docker-compose up

build-run: build run

shell:
	@docker-compose run api /bin/bash
