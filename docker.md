### docker commands

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



outlook command
to:sunwei has:attachment

docker build -f devops/Dockerfile . -t faceengine_build

sudo chmod -R 777 /home/jenkins_home/
 

### to run sudo in docker 
sudo usermod -G sudo,dev,docker sayem

### -d for background mode or detached mode
docker run  --name sayem -it -d -v /home/jenkins_home/workspace:/var/jenkins_home/workspace -p 8080:8080 -p 50000:50000 faceengine_build
docker run --runtime=nvidia -it --rm -v /home/sayem/handpose-master:/home/handpose crossinfonet:gpu


### docker set-up
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
