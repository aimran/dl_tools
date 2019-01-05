FROM nvcr.io/nvidia/pytorch:18.12.1-py3

LABEL maintainer="Asif Imran <asif_imran@icloud.com>"

ENV LANG=C.UTF-8

RUN apt-get update && apt-get install -y --allow-downgrades --no-install-recommends \
    	python-qt4 \
	ca-certificates \
	vim \
	git \
	zip \
	unzip \
    	libpng-dev \
	libjpeg-dev && \
    rm -rf /var/lib/apt/lists/* 

COPY .condarc /root/.condarc

COPY jupyter_notebook_config.py /root/.jupyter/

WORKDIR /fastai

RUN chmod -R a+w /fastai

WORKDIR /code

EXPOSE 8891

