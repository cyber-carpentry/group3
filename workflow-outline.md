### Overview
['Source'](<https://github.com/salathegroup/plantvillage_deeplearning_paper_analysis>)

## Inputs
# Start training
./train.sh

# Start the tests
./test.sh

# Generate results
./results/generate_results.sh

## Outputs
# Results folder contents
- classification reports\
- confusion matrices\
- evaluation graphs


### plantvillage_deeplearning_paper_dataset/generate_lmdb.sh

# come back to this one
create directory: /home/mohanty/data/final_dataset/lmdb/color-80-20

## Outputs
# mean_file
mean.binaryproto

# lmdb dataset
train_db


### train_val.prototxt

## Inputs
# mean_file
mean.binaryproto
create directory: /home/mohanty/data/final_dataset/lmdb/color-80-20

# lmdb dataset
train_db
create directory: /home/mohanty/data/final_dataset/lmdb/color-80-20

## Outputs
used in solver.prototxt


### solver.prototxt

## Inputs
# Train phase caffe configurations
train_val.prototxt

# Snapshot prefixes
create directory: /scratch/mohanty/AWS_FRESH_RUN/snapshots_final/googLeNet_color-80-20_finetune


### train.sh

## Inputs
# Configure solver for caffe
solver.prototxt

# ImageNet-trained model
bvlc_googlenet.caffemodel

# Script to call ImageNet-trained model?
download_model_binary.py (caffe repo)

## Outputs
# Fill out cafe.log?


### test.sh

## Inputs
# Prototxt configurations corresponding to each snapshot from the training phase
test_prototxt directory and .prototxt files

# Snapshots from training phase
create directory: /scratch/mohanty/AWS_FRESH_RUN/snapshots_final/googLeNet_color-80-20_finetune

## Outputs
# Test logs
test_logs directory
