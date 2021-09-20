#!/bin/bash

pip install gdown pytorch_lightning lightning-bolts

mkdir -p logs/wandb checkpoints

cd checkpoints
gdown https://drive.google.com/uc?id=1PZcvIZw0VpEKQQdw3zmR6vC-OWX2LMqI
gdown https://drive.google.com/uc?id=1b81XTMU93Qat5inHeva4R8_GCdaJ3lGr
gdown https://drive.google.com/uc?id=1Pa3qgHwK_1JkA-k492gAjWPM5AW76-rl