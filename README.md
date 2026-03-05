# PHP Code Golf Docker (PHP 8.5.3 / mbstring only-ish)

PHP 8.5.3 CLI を Docker で固定し、拡張は **mbstring 以外ほぼ無効**に寄せたコードゴルフ用環境です。
（※PHP の “Core” に相当する機能や、ビルドに組み込まれたものは完全には外せません。`php -m` で確認してください）

## Requirements
- Docker Desktop / Docker Engine
- Docker Compose (plugin)
- PhpStorm

## Setup
```bash
docker compose up -d --build
docker compose exec php php -v
docker compose exec php php -m
```

## ディレクトリ構成
```
.
├─ compose.yaml
├─ Dockerfile
├─ docker/
│  └─ php.ini
├─ src/            # 解答コード置き場
├─ inputs/         # 入力ファイル置き場（テストケース）
└─ README.md
```
