FROM bvlc/caffe:cpu
RUN pip install lmdb
COPY src /app
WORKDIR /app
VOLUME database_caffe
VOLUME input_images
