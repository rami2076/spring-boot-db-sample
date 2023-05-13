# Case without tagged, default tag name is latest
docker stop postgresql_container
docker rm postgresql_container
docker rmi postgresql_image
docker build ./ --tag postgresql_image
docker run -p 5432:5432 --name postgresql_container postgresql_image
