#!/bin/bash

if [ $(id -u) -ne 0 ]; then 
    echo -e "\e[31m You should be root user to perform this script \e[0m"
    echo -e "Example usage: \n\t \e[35m sudo bash $0 \e[0m"
    exit 2
fi

echo "Installing Jenkins"

curl -L -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo 

 rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key




yum upgrade -y 
# Add required dependencies for the jenkins package
yum install fontconfig java-17-openjdk
yum install jenkins -y
systemctl daemon-reload
systemctl enable jenkins
echo -e "Installation Completed \n\t \e[32m *** Make sure to start the service***  \[0m"



#from jenkins doc

# sudo wget -O /etc/yum.repos.d/jenkins.repo \
#   curl  https://pkg.jenkins.io/redhat-stable/jenkins.repo
# sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
# sudo yum upgrade
# # Add required dependencies for the jenkins package
# sudo yum install fontconfig java-17-openjdk
# sudo yum install jenkins
# sudo systemctl daemon-reload

# sudo wget -O /etc/yum.repos.d/jenkins.repo \
#     https://pkg.jenkins.io/redhat-stable/jenkins.repo



