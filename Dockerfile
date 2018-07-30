FROM ubuntu:14.04

#FORKED https://github.com/SexualRhinoceros/MusicBot
MAINTAINER koyu, https://git.koyu.space/koyu/saucebot

#Install dependencies
RUN sudo apt-get update \
    && sudo apt-get install software-properties-common -y \
    && sudo add-apt-repository ppa:fkrull/deadsnakes -y \
    && sudo add-apt-repository ppa:mc3man/trusty-media -y \
    && sudo apt-get update -y \
    && sudo apt-get install build-essential unzip -y \
    && sudo apt-get install python3.5 python3.5-dev -y --force-yes \
    && sudo apt-get install ffmpeg -y \
    && sudo apt-get install libopus-dev -y \
    && sudo apt-get install libffi-dev -y

#Install Pip
RUN sudo apt-get install wget \
    && wget https://bootstrap.pypa.io/get-pip.py \
    && sudo python3.5 get-pip.py

#Add musicBot
ADD . /app
WORKDIR /app

#Install PIP dependencies
RUN sudo pip install -r requirements.txt

#Add volume for configuration
#VOLUME /app/config
#Not needed since you can mount directories as volume
#This will also allow to clear the cache more easily since
#it's embedded more logical in the filesystem in case the disk
#runs full

CMD python3.5 run.py
