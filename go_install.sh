#!/bin/bash
# program:
#	Install go-lang:1.14.6
# 2020/07/28  zyj  release-1.0

# Update the apt to install last wget
echo "===============Upate the apt======================="
sudo apt-get update -y
echo "===========Installing wget from apt datebase========"
sudo apt-get install wget -y
sudo apt-get install vim -y
# Download the go about v1.14.6 into '~/Downloads'
echo "=============Now!!! Download the go zip....========="
# if install 64bits:
wget -P /home/ubuntu/Downloads https://dl.google.com/go/go1.14.6.linux-arm64.tar.gz
# if install 32bits:
#wget -P ~/Downlads https://dl.google.com/go/go1.14.6.linux-386.tar.gz

# Unzip go1.14.6.linux-amd64.tar.gz to '/usr/local'
echo "=========Now!!! Unzip the go to the /usr/local============="
sudo tar -xzvf /home/ubuntu/Downloads/go1.14.6.linux-arm64.tar.gz -C /usr/local/
# Create the gopath and src, bin, pkg
echo "==========Now!!! make folder name as src, bin, pkg=========="
mkdir -p /home/ubuntu/gopath/src
mkdir /home/ubuntu/gopath/bin
mkdir /home/ubuntu/gopath/pkg

# Setting the env of go
sudo echo "==========Writing the env seting to the /etc/profile==========="
sudo echo "export GOROOT=/usr/local/go">>/etc/profile
sudo echo "export GOPATH=/home/ubuntu/gopath">>/etc/profile
sudo echo 'export GOBIN=$GOPATH/bin'>>/etc/profile
sudo echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin'>>/etc/profile
sudo echo 'export GO111MODULE=auto'>>/etc/profile
sudo echo 'export GOPROXY=https://goproxy.io,direct'>>/etc/profile
#source /etc/profile
# reboot the device to load env
# sudo reboot
echo "==============the env of go ==============="
#go env

echo "Installing successfully..."
#go version

#echo "GOPATH=$GOPATH"
#echo "GOROOT=$GOROOT"
