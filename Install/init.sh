#!/bin/bash

if [ $(id -u) -ne 0 ]; then 
    echo -e "\e[31m You should be root user to perform this script \e[0m"
    echo -e "Example usage: \n\t \e[35m sudo bash $0 \e[0m"
    exit 2
fi

echo "Installing Jenkins"
cp ./jenkins.repo /etc/yum.repos.d/jenkins.repo
yum upgrade -y 
# Add required dependencies for the jenkins package
yum install fontconfig java-17-openjdk -y
yum install jenkins -y
systemctl daemon-reload
systemctl enable jenkins
echo -e "Installation Completed \n\t \e[32m *** Make sure to start the service***  \[0m"