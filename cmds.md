## Table of Contents  
[.ssh](#ssh)  
[git](#git)
[Ubuntu commands](#ubuntu_cmds)  
[FFMPEG](#ffmpeg)  
[Tunnelling](#tunnelling)  
[Attach a process](#attach_a_process)  
[Shared Library](#shared_library)  
[Windows](#windows)  
[Building from source](#building_from_source)

[C++ environment and compilers](#c++_environment)

### Ubuntu commands
```
alias apt_get_no='sudo apt-get -o Acquire::http::proxy=false '

fdisk -l
sudo mount  /dev/nvme0n1p4 /mnt/d
mkdir /mnt/d
export DESTDIR="$HOME/Software/LocalInstall" && make -j4 install


wget -O deleteMeLater.tmp https://www.youtube.com/watch?v=wQcchdeS4QY
cat deleteMeLater.tmp | grep fullscreenUrl
wget -O rickroll.flv 'http://www.youtube.com/get_video?video_id=eBGIQ7ZuuiU&l=210&sk=QHSGy-6-eiJ6h5qtrj1kR2OJanvL6tLlC&fmt_map=&t=OEgsToPDskIjlCX_1shTRBRDv2UQzVb-&hl=en&plid=AAROOIUyvpMFnjvzAAAAoARsYAg&tk=6J3d54cPnMJP7mUN2BtMkd2OmbgxTvB_GPcrV3ckGUbzd7KVMiH1kA%3D%3D&title=Rick Roll'

 git stash save -p "my commit message"

find /path/to/files -type f -exec sed -i 's/oldstring/new string/g' {} \;
(frame|ipuProcess.cpp:752)

git revert --strategy resolve <commit>
adb shell pidof com.huawei.videoanalysisengine


// show processes
pstree
ps -Ae


dpkg-query --list 'pattern*' lists all packages that have not been purged
dpkg-query --search 'pattern*' searches for individual files installed
sudo dpkg -S wine
sudo dpkg -r --force-depends libwine-development:i386
sudo apt-get --purge remove wine-mono0.0.8
sudo dpkg -r --force-depends  wine64-development


sudo apt-get update
sudo apt-get autoclean
sudo apt-get clean
sudo apt-get autoremove //apt-get -s autoremove to do a simulated dry
sudo apt-get build-dep packagename // means to install all dependencies for 'packagename' so that I can build it".
```
<a name="ffmpeg"/>

## ffmpeg ----------------------------------
```
ffmpeg -i input.mp4 -vcodec mjpeg output.mjpeg
ffmpeg -i output.mjpeg -vcodec mjpeg output.avi

ffmpeg -i output.avi -qscale 0 -ss 00:00:05.0 -t 00:00:10.0 cut.avi

ffmpeg -i  bridal_shower.mp4 -ss 00:03:02 -to 00:03:10 -acodec copy -vcodec copy  cut.mp4

ffmpeg  Nirvana2.mp4 -ss 00:09:10 -t 00:10:10 nirvana/nirvana_%d.png
ffmpeg -i This_is_Happy.mp4 Happy/This_is_Happy_%d.png

ffmpeg -i VID_2_persons_distance.mp4 -vf "scale=1080:1920" 2_persons_distance.mp4
```
<a name="tunnelling"/>

## tunnelling -------------------------------
```
//remote port forwarding
ssh -NfL 6006:localhost:6006 username@remote_server_address
```
< a name="attached_a_process"

## Attached a process which is detached
```
reptyr PID
```
<a name="shared_library">
 
## shared_library ----------------------------
readelf -d $executable | grep 'NEEDED'
readelf -d /lib/libOpenCL.so | grep 'NEEDED'
ldd /path/executable

<a name="windows">
 
## Windows-----------------------------
```
 netstat -ano|grep 8888
 taskkill /f /im 24536
reptyr pid


lsb_release -a 


 pip3 install tensorflow-gpu==2.0.0-beta1 --index-url=http://pypi.python.org/simple/ --trusted-host pypi.python.org
 
 "taskset -c 0 python my_program.py" will limit my_program.py to CPU:0.

```
<a name="ssh">
 
## .ssh file permision--------------------------
```
stat -c "%a" .ssh
700 for .ssh
644 for .pub
600 for id_rsa
600 authorized_keys // copy local .pub file into authorized_keys
755 for config
git multiple keys
https://docs.gitlab.com/ee/ssh/
```
<a name="git">
         
## git commands
```
git config --local -e
git diff HEAD^^ HEAD main.c
git log --after=jun9 --before=jun10

### search log
git log --all --grep='Build 0051'
### To search the actual content of commits through a repo's history, use:
git grep 'Build 0051' $(git rev-list --all)

// large file issue
git filter-branch --index-filter 'git rm -r --cached --ignore-unmatch <file/folder>' HEAD
```

## apt-key #####################

#### Remove it from sources.list.

#### If it was added by add-apt-repository then you will find it in its own file in /etc/apt/sources.list.d, not in the main sources.list.
```
sudo rm /etc/apt/sources.list.d/nemh-systemback-precise.list
Optional: Stop trusting the key
```
#### Use apt-key list to list trusted keys. Look for an entry like "Launchpad PPA for Kendek" in this case. Then use apt-key del to delete it:
```
sudo apt-key del 73C62A1B
```
The keyid is the last 8 characters of the gpg key's fingerprint, which is that long hex-code under pub


#### Installing package without root previlege
```
apt-get source package
cd package
./configure --prefix=$HOME
make
make install
```

With dpkg 
```
apt-get download package
dpkg -x package.deb dir
```
#### Bazel download certificate issue
dd the following line to your ~/.bazelrc

startup --host_jvm_args=-Djavax.net.ssl.trustStore=/etc/ssl/certs/java/cacerts \
        --host_jvm_args=-Djavax.net.ssl.trustStorePassword=changeit
        
        
#### vscode show pointers
```
*(float(*)[64])patch.data
```

#### Docker
```
docker build -t tag
sudo docker run --name sayem -it -d   -v /home/sayem:/home/sayem -p 8000:8000 sayem:latest
docker exec -it <name or id> /bin/bash
web server:
docker run --restart unless-stopped --link memcached:memcached -d -e DJANGO_SETTINGS_MODULE=smartplayer_controller.settings.production -e FRONT_END_HOST=10.193.97.76 -e FRONT_END_PORT=8000 -e REACT_APP_BACK_END_URL=10.193.97.76:8000 -v /app/data:/media -v /app/backend:/db -p 8000:80 -t smartplayer:v1
fea04f87550b5d7b8677f39f3c2fcff90075ab8ea20af8f6a52a7f3abdc05790
```

### http server
```
 python -m http.server 8001  
```
### Java installation ubuntu
There are two componets jre and jdk
you can configure the environment of java
```
sudo apt install openjdk-11-jdk
sudo apt install openjdk-11-jre

sudo update-alternatives --config java
sudo update-alternatives --config javac
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/bin/"
```

### python http server or ftp server
```
python3 -m http.server 8001
```
<a name="building_from_source">
 
### building from source code (git)
 
 ```
 sudo apt-get install build-essential fakeroot dpkg-dev -y
sudo apt-get build-dep git -y
sudo apt-get install libcurl4-openssl-dev -y
cd ~
mkdir source-git
cd source-git/
apt-get source git
cd git-2.*.*/
sed -i -- 's/libcurl4-gnutls-dev/libcurl4-openssl-dev/' ./debian/control
sed -i -- '/TEST\s*=\s*test/d' ./debian/rules
dpkg-buildpackage -rfakeroot -b -uc -us
sudo dpkg -i ../git_*ubuntu*.deb

 ```
<a name="c++_environment">
 
### C++ environment and compilers
gcc: GNU C      Compiler
g++: GNU C++ Compiler

```
System wide C change on Ubuntu:
sudo update-alternatives --config cc
System wide C++ change on Ubuntu:

sudo update-alternatives --config c++
```
