# HOGE

## init

### 前提

- dockerを実行可能な状態であること。

### 初期化

Install

Docker init


```shell
docker-compose -f ./db/postgresql/docker-compose.yaml  up -d
```

DB access

```shell
docker-compose -f ./db/postgresql/docker-compose.yaml run postgres-cli
```