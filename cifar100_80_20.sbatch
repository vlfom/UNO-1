#!/bin/bash
#SBATCH --job-name=ncdod-uno-cifar100_80_20
#SBATCH --nodes=1
#SBATCH --cpus-per-gpu=8
#SBATCH --gres=gpu:1,VRAM:8G
#SBATCH --mem=16GB
#SBATCH --time=48:00:00
#SBATCH --output=/storage/slurm/fomenko/slurm_runs/slurm-%j.out
#SBATCH --error=/storage/slurm/fomenko/slurm_runs/slurm-%j.out
#SBATCH --mail-user=ge73hov@mytum.de
#SBATCH --mail-type=ALL
#SBATCH --exclude=node11,node12,node13,node14

module load cuda/11.2

source /usr/stud/fomenko/miniconda3/etc/profile.d/conda.sh
conda activate uno

export WANDB_API_KEY=87aa2fdb13af7a78e29a73a7531cdc07b2fcfe27

python main_discover.py \
    --dataset CIFAR100 --download --gpus 1 --precision 16 \
    --max_epochs 200 --batch_size 256 --num_labeled_classes 80 --num_unlabeled_classes 20 \
    --pretrained checkpoints/pretrain-resnet18-CIFAR100-80_20.cp --num_heads 4 --comment 80_20 \
    --project 'thesis-ncd'