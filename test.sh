#!/bin/bash
  
#SBATCH --workdir /home/mohanty/caffe_experiments/AWS_FRESH_RUN/experiment_configs/googLeNet/color-80-20/finetune
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 2
#SBATCH --mem 16384
#SBATCH --time 23:59:59
#SBATCH --partition gpu
#SBATCH --gres gpu:1
#SBATCH --qos gpu


# Change the path: not sure how yet
#export PATH=/home/mohanty/caffe/build/install/bin/:$PATH
echo STARTING AT `date`

time caffe test -model test_prototxts/iter_1823.prototxt -weights /scratch/mohanty/AWS_FRESH_RUN/snapshots_final/googLeNet_color-80-20_finetune/snapshots__iter_1823.caffemodel -gpu all -iterations 440 &> ./test_logs/iter_1823.log
time caffe test -model test_prototxts/iter_3646.prototxt -weights /scratch/mohanty/AWS_FRESH_RUN/snapshots_final/googLeNet_color-80-20_finetune/snapshots__iter_3646.caffemodel -gpu all -iterations 440 &> ./test_logs/iter_3646.log
time caffe test -model test_prototxts/iter_5469.prototxt -weights /scratch/mohanty/AWS_FRESH_RUN/snapshots_final/googLeNet_color-80-20_finetune/snapshots__iter_5469.caffemodel -gpu all -iterations 440 &> ./test_logs/iter_5469.log
time caffe test -model test_prototxts/iter_7292.prototxt -weights /scratch/mohanty/AWS_FRESH_RUN/snapshots_final/googLeNet_color-80-20_finetune/snapshots__iter_7292.caffemodel -gpu all -iterations 440 &> ./test_logs/iter_7292.log
time caffe test -model test_prototxts/iter_9115.prototxt -weights /scratch/mohanty/AWS_FRESH_RUN/snapshots_final/googLeNet_color-80-20_finetune/snapshots__iter_9115.caffemodel -gpu all -iterations 440 &> ./test_logs/iter_9115.log
time caffe test -model test_prototxts/iter_10938.prototxt -weights /scratch/mohanty/AWS_FRESH_RUN/snapshots_final/googLeNet_color-80-20_finetune/snapshots__iter_10938.caffemodel -gpu all -iterations 440 &> ./test_logs/iter_10938.log
time caffe test -model test_prototxts/iter_12761.prototxt -weights /scratch/mohanty/AWS_FRESH_RUN/snapshots_final/googLeNet_color-80-20_finetune/snapshots__iter_12761.caffemodel -gpu all -iterations 440 &> ./test_logs/iter_12761.log
time caffe test -model test_prototxts/iter_14584.prototxt -weights /scratch/mohanty/AWS_FRESH_RUN/snapshots_final/googLeNet_color-80-20_finetune/snapshots__iter_14584.caffemodel -gpu all -iterations 440 &> ./test_logs/iter_14584.log
time caffe test -model test_prototxts/iter_16407.prototxt -weights /scratch/mohanty/AWS_FRESH_RUN/snapshots_final/googLeNet_color-80-20_finetune/snapshots__iter_16407.caffemodel -gpu all -iterations 440 &> ./test_logs/iter_16407.log
time caffe test -model test_prototxts/iter_18230.prototxt -weights /scratch/mohanty/AWS_FRESH_RUN/snapshots_final/googLeNet_color-80-20_finetune/snapshots__iter_18230.caffemodel -gpu all -iterations 440 &> ./test_logs/iter_18230.log
time caffe test -model test_prototxts/iter_20053.prototxt -weights /scratch/mohanty/AWS_FRESH_RUN/snapshots_final/googLeNet_color-80-20_finetune/snapshots__iter_20053.caffemodel -gpu all -iterations 440 &> ./test_logs/iter_20053.log
time caffe test -model test_prototxts/iter_21876.prototxt -weights /scratch/mohanty/AWS_FRESH_RUN/snapshots_final/googLeNet_color-80-20_finetune/snapshots__iter_21876.caffemodel -gpu all -iterations 440 &> ./test_logs/iter_21876.log
time caffe test -model test_prototxts/iter_23699.prototxt -weights /scratch/mohanty/AWS_FRESH_RUN/snapshots_final/googLeNet_color-80-20_finetune/snapshots__iter_23699.caffemodel -gpu all -iterations 440 &> ./test_logs/iter_23699.log
@@@    
