### README

A minimal/no-fuss docker shim for firing up fastai on your GPU-enabled box. It uses a pre-built nvidia container to 
address software dependancies. 

Afterwards, it mounts youe local `fastai` directory inside the container. I prefer to version control both code (fastai)
and utilities (this repo!) 

Preliminary:

1. Tested on ubuntu 16.04 only  
2. Install latest nvidia drivers (_not_ dev packages like CuDNN) for your machine
3. Install docker (see `install/01_install_docker.sh`)  
4. Install nvidia-docker (see `install/02_install_nvidia_docker.sh`)  
5. You have cloned `fastai` somewhere locally (I recommend forking it)  

CAUTION: Avoid committing sensitive information in your docker image that is PUBLIC. 


### Setup 

The following is a one-time setup. 

1. Make your image 

```shell
make docker-build
```

2. Start container (this will drop you inside it)

```shell
make docker-run
```

3. Install fastai and related packages (takes about 20 mins)

```shell
make build-fastai
```


### Running jupyter server

```shell
make notebook
```

You should be able to reach your server at `http://localhost:8891/?token=blahblah`
