FROM python:3.12-slim-bookworm
COPY --from=ghcr.io/astral-sh/uv:0.4.18 /uv /bin/uv

# Copy the project into the image
ADD . /app

# Sync the project into a new environment, using the frozen lockfile
WORKDIR /app
COPY . /app
RUN uv sync
