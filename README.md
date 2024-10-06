### uv を触ってみた

- M1 Mac
- Sonoma 15.0.1

- [DjangoMeetupTokyo #13 中級者向けハンズオン](https://tokibito.github.io/django-meetup-tokyo-13/)
- [uv の公式ドキュメント](https://docs.astral.sh/uv/guides/integration/docker/)

local_settings.py をリポジトリ直下に作成

```sh
# settings.py のシークレットキー
SECRET_KEY = "xxx"
```

### コマンド

```sh
# コンテナ作成
user@MacBook-Pro django_tutorial % docker compose build --no-cache

# コンテナ起動
user@MacBook-Pro django_tutorial % docker compose up -d

# コンテナ再起動
user@MacBook-Pro django_tutorial % docker compose restart

# ローカルサーバーのURLにアクセスできるようになる
http://127.0.0.1:8000/

# コンテナを閉じる
user@MacBook-Pro django_tutorial % docker compose down

# キャッシュクリア
user@MacBook-Pro django_tutorial % docker builder prune -f

# コンテナに入る
user@MacBook-Pro django_tutorial % docker container exec -it django_blog-web-1 bash
```

```sh
# Python のバージョン確認
user@MacBook-Pro django_tutorial % docker compose run --rm web python -V

# Django のバージョン確認
user@MacBook-Pro django_tutorial % docker compose run --rm web uv run python -m django --version

# Django のプロジェクト作成
user@MacBook-Pro django_tutorial % docker compose run --rm web uv run django-admin startproject myproject ./

# スーパーユーザーの作成
user@MacBook-Pro django_tutorial % docker compose run --rm web uv run manage.py createsuperuser

# アプリケーションの作成
user@MacBook-Pro django_tutorial % docker compose run --rm web uv run manage.py startapp reservation

# マイグレーション
user@MacBook-Pro django_tutorial % docker compose run --rm web uv run manage.py makemigrations reservation
user@MacBook-Pro django_tutorial % docker compose run --rm web uv run manage.py migrate

# ruff の実行
user@MacBook-Pro django_tutorial % docker compose run --rm web uv run ruff check . --fix
user@MacBook-Pro django_tutorial % docker compose run --rm web uv run ruff format .
```

