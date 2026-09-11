default:
    @just --list

sync:
    uv sync

lint:
    uv run ruff check .

format:
    uv run ruff format .
    prettier --write .

prettier-check:
    prettier --check .

typecheck:
    uv run pyright

test:
    uv run pytest

prose:
    vale articles docs

check: lint typecheck test prettier-check
