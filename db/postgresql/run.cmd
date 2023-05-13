docker stop postgresql-container
docker rm postgresql-container
docker rmi postgresql-image:dev
docker build ./ --tag postgresql-image:dev
docker run -p 5432:5432 --name postgresql-container postgresql-image:dev
