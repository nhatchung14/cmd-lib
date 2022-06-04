
# Setup Docker on Ubuntu/Debian-based:
``` bash
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker
```

**Install GPU dependencies for GPU usage**
``` bash
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker
```

**How to run without sudo:**

``` bash
sudo groupadd docker
sudo gpasswd -a <your linux username> docker
```
Then either do `$ newgrp docker` or log out/in to activate the changes to groups.


# Via Miniconda or Anaconda

See installation of Miniconda/Anaconda for ```pip```.

``` bash
pip install docker
```
