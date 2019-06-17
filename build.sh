# remove old version
sudo docker stop -t0 bdsc
sudo docker rm bdsc
sudo docker rmi bds
# build and run new version
sudo docker build --pull --no-cache -t bds .
sudo docker create --name=bdsc -v /:/mnt --net=host bds
sudo docker start bdsc
sudo docker exec -it bdsc bash
