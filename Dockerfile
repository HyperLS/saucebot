FROM ubuntu:18.04

#Install dependencies
RUN apt-get update \
    && apt-get install software-properties-common -y \
    && apt-get update -y \
    && apt-get install build-essential unzip -y \
    && apt-get install python3 python3-dev -y \
    && apt-get install ffmpeg -y \
    && apt-get install libopus-dev -y \
    && apt-get install libffi-dev -y

#Install Pip
RUN apt-get install wget -y \
    && wget https://bootstrap.pypa.io/get-pip.py \
    && python3 get-pip.py \
    && rm get-pip.py

#Add musicBot
ADD . /musicBot
WORKDIR /musicBot

#Install PIP dependencies
RUN pip install -r requirements.txt

#Add volume for configuration
VOLUME /musicBot/config

CMD python3 run.py
