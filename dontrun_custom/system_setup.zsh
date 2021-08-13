sudo swapon /swapfile
sudo nvidia-smi --id=0 -pm 1
sudo nvidia-smi --id=0 --power-limit=250
sudo nvidia-smi --id=1 -pm 1
sudo nvidia-smi --id=1 --power-limit=250
