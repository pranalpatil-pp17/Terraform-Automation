#!/bin/bash

# Installation script for Jenkins, Git, and Terraform on Ubuntu Linux

echo "========================================"
echo "Installing Jenkins, Git, and Terraform"
echo "========================================"
echo ""

# Update system packages
echo "Updating system packages..."
sudo apt update -y

# Install Jenkins
echo "Installing Jenkins..."
sudo apt install -y openjdk-17-jdk
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io.key
sudo echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo "Jenkins installed and started"
echo ""

# Install Git
echo "Installing Git..."
sudo apt install -y git
echo "Git installed"
echo ""

# Install Terraform
echo "Installing Terraform..."
sudo apt install -y wget curl gnupg software-properties-common
sudo wget -O- https://apt.releases.hashicorp.com/gpg | \
  gpg --dearmor | \
  sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
sudo echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg]" \
  https://apt.releases.hashicorp.com $(lsb_release -cs) main | \
  sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update -y
sudo apt install -y terraform
echo "Terraform installed"
echo ""


echo "========================================"
echo "Installation Complete!"
echo "========================================"
echo ""
echo "Verifying installations..."
echo "Jenkins: $(systemctl is-active jenkins)"
echo "Git version: $(git --version)"
echo "Terraform version: $(terraform -version | head -n 1)"
echo ""
echo "All tools have been successfully installed!"
