# Create Docker image
## [Option #1] Pull image from Docker Hub
For example, we refer some image from `nvidia/cuda` from [DockerHub](https://hub.docker.com/r/nvidia/cuda):
```
$ docker pull nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04
```
The general syntax is:
```
$ docker pull <repository name>:<image tag>
```

## [Option #2] Build image from Dockerfile
We prepare a dockerfile. A sample is presented below:
```
FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
WORKDIR /home/

RUN apt-get update && apt-get install -y apt-utils && apt-get install --no-install-recommends --no-install-suggests -y curl
RUN apt-get install -y build-essential
RUN apt-get install -y software-properties-common
RUN apt-get -y install xauth
RUN apt-get install -y wget nano unzip vim
RUN apt-get install -y cmake git pkg-config libgtk-3-dev \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
    libxvidcore-dev libx264-dev libjpeg-dev libpng-dev libtiff-dev \
    gfortran openexr libatlas-base-dev python3-dev \
    libtbb2 libtbb-dev libdc1394-22-dev ffmpeg
```
**Build the Dockerfile**
We assume that the dockerfile is located in the current directory `.`
Then, we build the dockerfile with a `name` and a `tag` as follow:
``` bash
docker build -t name:tag .
```

# Initial run the image and initialize the container
There are some flags that we need to refer:
+ `-it` is for interactive mode
+ `--gpu` to specify GPU that we need to use
+ `-v` for mapping a local folder to "remote" folder in container
+ `-p` for port mapping
+ `--name` to indicate the name of container

We run the Docker image as following command:
``` bash
docker run -it --gpus all \
    -v <machine folder>:<container folder> \
    -p 8888:8888 -p xxxxx:yyyyy \
    --name <container-name> \
    <docker-image>
```


## Link docker container display to host machine:

1. Set up Docker Container connection to display
``` bash
xauth list
```

It should show something like...

> g531/unix:  MIT-MAGIC-COOKIE-1  d323cfe33a738d7f078b7d984b760a83

2. Use Docker, run command with the following additional parameters `--net=host -e DISPLAY -v /tmp/.X11-unix`:
```
docker run -it --gpus all \
	-v <machine folder>:<container folder> \
	--net=host -e DISPLAY -v /tmp/.X11-unix \
	--name <container name> \
	<docker image>
```

3. Connect display: Remember to add the index of the display `<0 or 1>` in the command
```
$ xauth
$ xauth add g531/unix:0   MIT-MAGIC-COOKIE-1  d323cfe33a738d7f078b7d984b760a83
$ xauth add g531/unix:1   MIT-MAGIC-COOKIE-1  d323cfe33a738d7f078b7d984b760a83
```


# Re-run Docker image
To reattach exitted container:
``` bash
docker start <container name> && docker attach <container name>
```
**Create another bash shell of the same container:**
``` bash
docker exec -it <container name> /bin/bash
```


# Commit container to a docker image: 
To commit the container, we perform (`<new img tag>` is optional):
``` bash
docker commit <container id> <new img name>:<new img tag>
```

# Pushing to DockerHub:
1. Login: docker login
2. Tag image to upload: 
``` bash
docker tag \
    <local-img-name>:<local-img-tag> <repository-on-DockerHub>:<tag-image-uploaded>
```
3. Push to DockerHub: 
``` bash
docker push <repository-on-DockerHub>:<tag-image-uploaded>
```


# List Docker images and containers
## List Docker images
``` bash
docker images
```

## List Docker containers
``` bash
docker ps -a
```

# Remove Docker images and containers
## Remove Docker images
``` bash
docker image rm <image_name:image_tag>
```
or
``` bash
docker image rm <image id>
```

## Remove Docker containers
``` bash
docker container rm <container-name>
```
or
``` bash
docker container rm <container-id>
```
