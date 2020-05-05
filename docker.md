### quick commands   
```
 docker run --network="host" -e NVIDIA_VISIBLE_DEVICES=all c197cbab8593 apt-get update
```

### docker commands

```
docker exec -it d26d8019ff61 /bin/bash

 docker ps

nvidia-docker start 7b9926cf8cfa
 7b9926cf8cfa


 nvidia-docker run -t -v /media/sdb/sayem/videos:/root/videos -v /media/sdb/sayem/code:/root  tf/1.5:gpu /bin/bash
 or docker run  --name sayem -d -v /home/jenkins_home/workspace:/var/jenkins_home/workspace -p 8080:8080 -p 50000:50000 faceengine_build



nvidia-docker run -t -v /media/sdd/shared_data:/root/data  tf/1.5:gpu /bin/bash

After running this exit and then run 
nvidia-docker start name
nvidia-docker exec –it name /bin/bash

docker build -f devops/Dockerfile . -t faceengine_build

sudo chmod -R 777 /home/jenkins_home/
 
```
### to run sudo in docker 
```
sudo usermod -G sudo,dev,docker sayem
```
### proxy issue   
first turn GateWay yes in /etc/cntlm.conf    
create  .docker/config.json and add the following    
```
{
 "proxies":
 {
   "default":
   {
     "httpProxy": "http://127.0.0.1:3128",
     "httpsProxy": "http://127.0.0.1:3128",
     "noProxy": "localhost,.hwap,.huawei.com"
   }
 }
}
````
docker run --network="host"
### -d for background mode or detached mode
```
docker run  --name sayem --network="host" -it -d -v /home/jenkins_home/workspace:/var/jenkins_home/workspace -p 8080:8080 -p 50000:50000 faceengine_build
docker run --runtime=nvidia --network="host" -it --rm -v /home/sayem/handpose-master:/home/handpose crossinfonet:gpu
```
### docker image command    
remove an image
```
 sudo docker image rm tf_1.4:gpu
 ```
 rename an image    
 ```
 sudo docker tag image_ID tf_1.4_gpu:1
 ```
 save or export an image
 ```
 docker save image_id > image.tar
 docker load < image.tar
 ```
 
### docker set-up
```
mkdir /etc/systemd/system/docker.service.d
Now create a file called /etc/systemd/system/docker.service.d/http-proxy.conf that adds the HTTP_PROXY environment variable:

[Service]
Environment="HTTP_PROXY=http://proxy.example.com:80/"
If you have internal Docker registries that you need to contact without proxying you can specify them via the NO_PROXY environment variable:

Environment="HTTP_PROXY=http://proxy.example.com:80/"
Environment="NO_PROXY=localhost,127.0.0.0/8,docker-registry.somecorporation.com"
Flush changes:

$ sudo systemctl daemon-reload
Verify that the configuration has been loaded:

$ sudo systemctl show --property Environment docker
Environment=HTTP_PROXY=http://proxy.example.com:80/
Restart Docker:

$ sudo systemctl restart docker
```
### post installation     

```
sudo groupadd docker
sudo usermod -aG docker $USER
```
### docker build    
```
 sudo docker build -f Dockerfile_tf_py2 .

```

### X11 server or display forwarding
[link](#http://wiki.ros.org/docker/Tutorials/GUI)
```
docker run --runtime=nvidia  -it  --network="host"  --name="sayem1"  --user=$USER  --env="DISPLAY"  --workdir="/home/$USER"  --volume="/home/$USER:/home/$USER"  --volume="/etc/group:/etc/group:ro"   --volume="/etc/passwd:/etc/passwd:ro"  --volume="/etc/shadow:/etc/shadow:ro"  --volume="/etc/sudoers.d:/etc/sudoers.d:ro"  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"  tf_1.4:s2
```
