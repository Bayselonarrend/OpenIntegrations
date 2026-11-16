@echo off

docker-compose down -v
docker-compose pull
docker-compose build --no-cache
docker-compose up -d

pause

