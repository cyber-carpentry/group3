#!/bin/bash
  
#SBATCH --workdir /home/mohanty/caffe_experiments/AWS_FRESH_RUN/experiment_configs/googLeNet/color-80-20/finetune
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 2
#SBATCH --mem 16384
#SBATCH --time 23:59:59
#SBATCH --partition gpu
#SBATCH --gres gpu:2
#SBATCH --qos gpu


# Comment out: used for clusters
#module add caffe
#module add cuda
echo STARTING AT `date`

# Change path: bvlc_googlenet.caffemodel is the ImageNet-trained model
# For more info: https://github.com/BVLC/caffe/tree/master/examples/finetune_flickr_style, may need to run Python script first?
# Removed -gpu all (allows fine-tuning in cpu mode)
#caffe train -solver solver.prototxt -weights /home/mohanty/caffe_experiments/AWS_FRESH_RUN/models/bvlc_googlenet.caffemodel -gpu all &> caffe.log
caffe train -solver solver.prototxt -weights /models/bvlc_googlenet/bvlc_googlenet.caffemodel &> caffe.log
sbatch test.sh
echo FINISHED at `date`
