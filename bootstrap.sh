#! /bin/bash

component=$1
env=$2
dnf install ansible -y

REPO_URL=https://github.com/pavithrakasukurthi/terraform-ansible-roboshop.git
REPO_DIR=/opt/roboshop/ansible
ANSIBLE_DIR=terraform-ansible-roboshop

mkdir -p /opt/roboshop/ansible
mkdir -p /var/log/ansible
touch /var/log/ansible/ansible.log

cd $REPO_DIR

if [ -d $ANSIBLE_DIR ]; then
    cd $ANSIBLE_DIR
    git pull
else
    git clone $REPO_URL
    cd $ANSIBLE_DIR
fi

ansible-playbook -e component=$component -e env=$env main.yaml