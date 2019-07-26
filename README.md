# Group 3 Cyber Carpentry Project 2019

## Overview
The goal of our project was the reproduce the data preparation process performed by [`Mohanty et al. 2016`](<https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5032846/>). Databases of images and labels formatted for [`caffe`](<https://caffe.berkeleyvision.org/>) will be created.

*Study background*
Mohanty et al. used 54,306 images of healthy and infected leaves to train a deep convolution neural network to identify crop species and disease type. Their dataset includes images of leaves from 26 crops infected with 14 diseases (e.g. apple leaf with apple black rot), leading to 38 crop-disease combinations (i.e. labels). 

*In this tutorial, you will:*
1. Use the raw plant images, sorted into folders by label to create a list of images and labels for training and testing the model
    - Input: raw plant images and
    - Outputs: train.txt, test.txt
2. Create a formatted database of train images (80% of the dataset) and test images (20% of the database)
    - Inputs: train.txt, test.txt
    - Outputs: train_db, test_db
    
*We create two docker images for this task:* 
1. jiannancai/caffeprep:latest, the dockerfile is in [`here`](<https://github.com/cyber-carpentry/group3/blob/master/imageList_docker/Dockerfile>); 
2. jiannancai/databasegen:latest, the dockerfile is in [`here`](<https://github.com/cyber-carpentry/group3/blob/master/databaseGen_docker/Dockerfile>)

## Tutorial

*Recommended Jestream instance:* \
Centos 7(7.6) Development GUI v1.41 or ubuntu 18_04 Devel and Docker v1.22, m1.medium size

### Pull Docker images
```
$ docker pull jiannancai/caffeprep:latest
$ docker pull jiannancai/databasegen:latest
```
### Create volumes on your local device
```
$ docker volume create input_images
$ docker volume create database_caffe
```
### Prepare image lists from raw plant images

git clone author's repo for raw plant images 
```
$ docker run --rm --mount source=input_images,target=/input_images jiannancai/caffeprep:latest sh imageList_prep.sh
$ docker run -it --rm --mount source=input_images,target=/input_images jiannancai/caffeprep:latest sh
```
Now you are inside the container\
If you get the error "Key error: <some plant types>" when running the following python code, please re-run it.
```
$ python create_data_distribution.py
```
Exit the container
```
$ exit
```
### Prepare caffe database from image lists
```
$ docker run -it --mount source=database_caffe,target=/database_caffe --mount source=input_images,target=/input_images jiannancai/databasegen:latest sh
```
Now you are inside the container\
The following code converts test.txt to test_db
```
$ python create_db.py -b lmdb -s -r squash -c 3 -e jpg -C gzip -m ../input_images/plantvillage_deeplearning_paper_dataset/lmdb/color-80-20/mean.binaryproto  ../input_images/plantvillage_deeplearning_paper_dataset/lmdb/color-80-20/test.txt ../database_caffe/test_db 256 256
```
If you're interested in creating the train database (will take about 4x longer than test database):
```
$ python create_db.py -b lmdb -s -r squash -c 3 -e jpg -C gzip -m ../input_images/plantvillage_deeplearning_paper_dataset/lmdb/color-80-20/mean.binaryproto  ../input_images/plantvillage_deeplearning_paper_dataset/lmdb/color-80-20/train.txt ../database_caffe/train_db 256 256
```
Exit the container
```
$ exit
```
### Check the outputs
```
$ docker volume inspect database_caffe
```
Copy the path in "Mountpoints", which is the "path to your volume"\
The outputs should be <train/test>_db
```
$ sudo ls <path to your volume>
```
    
## Thank you for testing, if you have any suggestions or issues, please post in ['Issues'](<https://github.com/cyber-carpentry/group3/issues>)
