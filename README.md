# docker-app
Simple docker app with python3 for isolated workspace environment and scripting / testing python code

### Install

```shell
docker compose up -d
```

### Usage

The following command with get you inside the running container

```shell
docker compose exec app bash
```

Once you are inside the container you can easily execute the `app.py`

```shell
./app.py
```

This will execute your python code.