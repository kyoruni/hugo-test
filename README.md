# hugo-test

HUGO お試しリポジトリ

## 使い方
- コンテナ起動してから、`http://localhost:1313/` にアクセス

```bash
$ docker compose up -d
```

## 作業メモ

```bash
$ hugo new site quickstart
$ mv ./quickstart/* .
$ rm -rf ./quickstart

# anankeのテーマを導入
$ git init
$ git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
$ echo "theme = 'ananke'" >> hugo.toml

# 開発サーバー起動
$ hugo server --buildDrafts --watch --bind "0.0.0.0"
```