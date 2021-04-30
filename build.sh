# remove old version
sudo systemctl stop bucni_dicom.service
#sudo docker stop -t0 bdsc
sudo docker rm bdsc
sudo docker rmi bds
# build and run new version
sudo docker build --pull --no-cache -t bds .
sudo docker create --name=bdsc -v /dicom:/dicom -p 11112:11112 bds
sudo systemctl start bucni_dicom.service
#sudo docker start bdsc
# sudo docker exec -it bdsc bash
