#!/bin/bash
#essential system packages/libraries required

ENV="ENV"

install_ubuntu_packages() {
    sudo apt-get install g++ 
    sudo apt-get install python-dev python-pip python-virtualenv 
    sudo apt-get install git 
    sudo apt-get install libfreetype6-dev libpng-dev mercurial make
}

# has to activate virtuan env first
install_virtualenv(){
    cd ~
    virtualenv $ENV
    source ./$ENV/bin/activate   
}

#manually install sphinxcontrib-autorun
install_autorun(){
    mkdir -p ~/hg
    cd ~/hg
    hg clone http://bitbucket.org/birkenfeld/sphinx-contrib/
    cd sphinx-contrib/autorun
    python setup.py install
}

#get the doc source from github
install_manual_source(){
    mkdir -p ~/github
    cd ~/github
    git clone https://github.com/futuregrid/manual.git
}

#setting up essential python libraries
install_requirements(){
    cd manual
    pip install -r requirements_pre.txt
    easy_install -U distribute
    pip install -r requirements.txt
    pip uninstall PIL
}

#install_ubuntu_packages

install_virtualenv()
install_autorun()
install_manual_source()
install_requirements()
