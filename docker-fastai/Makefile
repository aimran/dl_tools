############## USER SHOULD CHANGE THESE ########################
REGISTRY = aimran
NAME = ai-fastai
VERSION = 0.1
DATADIR = /home/asif/data
CODEDIR = /home/asif/Code/fastai-v1
PORT = 8891
################################################################

.PHONY: docker-build docker-login docker-run 
SHELL := /bin/bash

# assumes env variable NVIDIAKEY is set - 
# e.g., in .bashrc do,
# export NVIDIAKEY=blahblah 
docker-login:
	docker login -u '$$oauthtoken' -p $(NVIDIAKEY) nvcr.io

docker-build: 
	docker build -t $(NAME):$(VERSION) -f Dockerfile .
	docker tag $(NAME):$(VERSION) $(REGISTRY)/$(NAME):$(VERSION)

docker-run:
	docker run --rm -ti --runtime=nvidia \
		            --shm-size 8G \
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
	
# Run this 
# We assume a dev build
# otherwise `pip install fastai` should suffice
build-fastai:
	#you may want to switch to dev branch here
	conda create -n fastai  python=3.7
	source activate fastai
	cd /fastai && tools/run-after-git-clone && pip install -e ".[dev]"

update-fastai:
	cd /fastai; git pull

	

