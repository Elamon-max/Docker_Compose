#!/bin/bash
# Xatolik bo'lsa skriptni to'xtatish
set -e

echo "Dockerni o'rnatish boshlandi..."
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Docker GPG kalitini qo'shish
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Repozitoriyni qo'shish
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Dockerni o'rnatish
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Foydalanuvchini docker guruhiga qo'shish
sudo usermod -aG docker vagrant

echo "Docker muvaffaqiyatli o'rnatildi!"