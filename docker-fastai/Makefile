############## USER SHOULD CHANGE THESE ########################
REGISTRY = aimran
NAME = ai-fastai
VERSION = 0.1
DATADIR = /home/asif/data
CODEDIR = /home/asif/Code/aimran-fastai
PORT = 8891
################################################################

.PHONY: docker-build docker-login docker-run 
SHELL := /bin/bash

# assumes env variable NVIDIAKEY is set - 
# e.g., in .bashrc do,
# export NVIDIAKEY=blahblah 
docker-login:
	docker login -u '$$oauthtoken' -p $(NVIDIAKEY) nvcr.io

docker-build: docker-login
	docker build -t $(NAME):$(VERSION) -f Dockerfile .
	docker tag $(NAME):$(VERSION) $(REGISTRY)/$(NAME):$(VERSION)

docker-run:
	docker run --rm -ti --runtime=nvidia \
			    -v $(PWD):/code \
			    -v $(DATADIR):/mnt/data \
			    -v $(CODEDIR):/fastai \
			    -p $(PORT):8891 \
			    --entrypoint /bin/bash \
			    ${REGISTRY}/${NAME}:${VERSION} 

#################################
# BELOW ARE FOR INSIDE CONTAINER
################################

# Bring up the jupyter server (most of the time)
notebook:
	source activate fastai && cd /fastai && jupyter notebook
	
# Run this (first time)
build-fastai:
	conda env create -f=/fastai/environment.yml
	conda clean -ya

# Run occasionally
update-conda: update-fastai
	conda env update -f=/fastai/environment.yml

update-fastai:
	cd /fastai; git pull

	

