# Emercoin Docker
Docker compose image for Emercoin core

### Для старта с нуля: 
 
Установить [Git](https://github.com/git-guides/install-git) 
Установить [Docker](https://docs.docker.com/engine/install/) и [docker-compose](https://docs.docker.com/compose/install/#install-compose) 

Склонировать репозитарий и перейти в папку с проектом:
```
git clone https://github.com/emercoin/docker && cd docker
``` 

**Запустить сборку контейнера с Emercoin:**
```
docker-compose up -d
```

По умолчанию для соедиения с контейнером используется 6662 порт

- пользователь: **emcrpc**
- пароль: **emcpass**
- метод: **POST** тело запроса пример {"method": "getinfo" }

**Сменить пароль в контейнере:**
```
docker-compose exec emc bash changepass.sh _you_rpc_password_
docker-compose restart emc
```

### Как проверить, что контейнер работает нормально?
Нужно отправить **POST** (с помощью Postman, например)
по адресу `http://emcrpc:_you_rpc_password_@127.0.0.1:6662`, тело запроса {"method": "getinfo" }

**В Python:**
```python
import requests

url = "emcrpc:_you_rpc_password_@127.0.0.1:6662"
payload = "{\"method\": \"getinfo\" }"
headers = { 'Content-Type': 'application/json' }
response = requests.request("POST", url, headers=headers, data = payload)
print(response.text.encode('utf8'))
```

**В командной строке c помощью Curl:**
(sudo apt-get update && sudo apt-get install curl) - если Curl не установлен
```bash
curl --location --request POST 'emcrpc:_you_rpc_password_@127.0.0.1:6662' \
--header 'Content-Type: application/json' \
--data-raw '{"method": "getinfo" }'
```
если все ок, ответом будет выдача в формате JSON:
```JSON
{
    "result": {
        "fullversion": "v0.7.10emc",
        "version": 71000,
        "protocolversion": 70015,
        "walletversion": 130000,
        "balance": 0.000000,
```

### Управление сборкой

**Остановить контейнер:**
```
docker-compose stop emc
```
**Удалить контейнеры:**
```
docker-compose down
```
