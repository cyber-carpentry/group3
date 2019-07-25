FROM ubuntu
RUN apt-get update && apt-get install -y python python-pip git
RUN pip install lmdb numpy
COPY src /app
WORKDIR /app
VOLUME /input_images
