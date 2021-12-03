### docker commands
docker network create app
docker run -d --network=app --name database -e POSTGRES_PASSWORD=<CHANGE> -e POSTGRES_USER=django -p 5432:5432 postgres:14-alpine
docker run -p 8000:8000 --network=app --name backend lib_catalog:v1

# apply db migrations
docker exec backend python manage.py migrate