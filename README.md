# docker_homework
# 1 Лекция
Написать Dockerfile для frontend располагается в директории /frontend, собрать и запустить
# 2 Лекция
Написать Dockerfile для backend который располагается в директории /lib_catalog(для сборки контейнера необходимо использовать файл /lib_catalog/requirements.txt), для работы backend необходим postgresql, т.е. необходимо собрать 2 контейнера:
1. backend
2. postgresql

Осуществить сетевые настройки, для работы связки backend и postgresql
# 3 Лекция
Написать docker-compose.yaml, для всего проекта, собрать и запустить

# Критерий оценки финального задания
1. Dockerfile должны быть написаны согласно пройденным best practices
2. Для docker-compose необходимо использовать локальное image registry
3. В docker-compose необходимо сетевые настройки 2 разных интерфейса(bridge), 1 - для фронта, 2 - для бека с postgresql

4.* Осущиствить сборку проекта самим docker-compose команда docker-compose build(при использовании этого подхода необходимо исключить 2 пункт из критерии оценки)


## docker-compose and docker commands
**Important:** You need linux machine or virtual machine

You need create .env file with ```POSTGRES_PASSWORD``` variable in root, default value for backend keep in settings.py

### build

```
docker-compose build
```

### run containers

```
docker-compose up -d
```

### apply db migrations
```
docker exec backend python manage.py migrate
```

### add backend hostname to /etc/hosts file
```
sudo ./scripts/add_hostname.sh
```
### open in browser:
```
http://127.0.0.1:3000
```


