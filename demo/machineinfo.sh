#!/bin/bash

sudo add-apt-repository universe
sudo apt install python3-pip -y 
sudo apt update
sudo apt upgrade -y
sudo apt install python -y
sudo apt install python-pip -y 
pip install flask -y
git clone https://github.com/abhishekmha/MachineInfoRepo.git
cd MachineInfoRepo
python ./app.py &
