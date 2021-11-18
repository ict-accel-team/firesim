#!/bin/bash

set -ex
set -o pipefail

echo "machine launch script started" > /home/centos/machine-launchstatus
sudo chgrp centos /home/centos/machine-launchstatus
sudo chown centos /home/centos/machine-launchstatus

{
sudo yum install -y ca-certificates
sudo yum install -y mosh
sudo yum groupinstall -y "Development tools"
sudo yum install -y gmp-devel mpfr-devel libmpc-devel zlib-devel vim git java java-devel
curl https://www.scala-sbt.org/sbt-rpm.repo | sudo tee /etc/yum.repos.d/scala-sbt-rpm.repo
sudo yum install -y sbt texinfo gengetopt libffi-devel
sudo yum install -y expat-devel libusb1-devel ncurses-devel cmake "perl(ExtUtils::MakeMaker)"
# deps for poky
sudo yum install -y python36 patch diffstat texi2html texinfo subversion chrpath git wget
# deps for qemu
sudo yum install -y gtk3-devel
# deps for firesim-software (note that rsync is installed but too old)
sudo yum install -y python36-pip python36-devel rsync
# Install GNU make 4.x (needed to cross-compile glibc 2.28+)
sudo yum install -y centos-release-scl
sudo yum install -y devtoolset-8-make

# install DTC
sudo yum -y install dtc

# get a proper version of git
sudo yum -y remove git
sudo yum -y install epel-release
sudo yum -y install https://repo.ius.io/ius-release-el7.rpm
sudo yum -y install git224

# install verilator
git clone http://git.veripool.org/git/verilator
cd verilator/
git checkout v4.034
autoconf && ./configure && make -j4 && sudo make install
cd ..

# bash completion for manager
sudo yum -y install bash-completion

# graphviz for manager
sudo yum -y install graphviz

# used for CI
sudo yum -y install expect

# todo: figure out how to setup on a per user basis

# upgrade pip
sudo pip3 install --upgrade pip
# install requirements
sudo python3 -m pip install fab-classic
sudo python3 -m pip install boto3
sudo python3 -m pip install colorama
sudo python3 -m pip install argcomplete
sudo python3 -m pip install graphviz
# for some of our workload plotting scripts
sudo python3 -m pip install --upgrade --ignore-installed pyparsing
sudo python3 -m pip install numpy
sudo python3 -m pip install kiwisolver
sudo python3 -m pip install matplotlib
sudo python3 -m pip install pandas
sudo python3 -m pip install awscli
sudo python3 -m pip install pytest
sudo python3 -m pip install moto
# needed for the awstools cmdline parsing
sudo python3 -m pip install pyyaml

# setup argcomplete
activate-global-python-argcomplete

} 2>&1 | tee /home/centos/machine-launchstatus.log

# get a regular prompt
echo "PS1='\u@\H:\w\\$ '" >> /home/centos/.bashrc
echo "machine launch script completed" >> /home/centos/machine-launchstatus
