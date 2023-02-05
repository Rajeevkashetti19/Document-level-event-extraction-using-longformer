#!/bin/bash

#SBATCH --account=cs678fl22
#SBATCH --job-name=mnist
#SBATCH --partition=gpuq
#SBATCH --qos=gpu

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --gres=gpu:A100.80gb:1
#SBATCH --mem=50GB
#SBATCH --export=ALL
#SBATCH --time=0-2:00:00

#SBATCH --output=mnist.%j.out
#SBATCH --error=mnist.%j.err

nvidia-smi

module load gnu10
module load python
CUDA_LAUNCH_BLOCKING=1
./scripts/train_kairos.sh

./scripts/test_kairos.sh

