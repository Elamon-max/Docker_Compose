#!/bin/bash

HOSTNAME=$(hostname)
TOKEN_FILE="/vagrant/swarm_token.txt"
MANAGER_IP="192.168.56.10"

if [ "$HOSTNAME" == "manager01" ]; then
    echo "Manager: Swarmni boshlayapmiz..."
    sudo docker swarm init --advertise-addr $MANAGER_IP
    # Tokenni hamma o'qiy oladigan joyga yozamiz
    sudo docker swarm join-token worker -q > $TOKEN_FILE
    echo "Manager tayyor va token saqlandi."

else
    echo "$HOSTNAME: Swarmga ulanish boshlandi..."
    # Token fayli paydo bo'lishini kutish (manager tayyor bo'lishi uchun)
    while [ ! -f $TOKEN_FILE ]; do
      echo "Token fayli kutilmoqda..."
      sleep 5
    done
    
    TOKEN=$(cat $TOKEN_FILE)
    sudo docker swarm join --token $TOKEN $MANAGER_IP:2377
    echo "$HOSTNAME klasterga ulandi!"
fi