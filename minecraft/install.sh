#!/bin/bash
SERVER_ROOT="/srv/minecraft"
MC_USER="minecraft"
MC_USER_PASSWORD="minecraft"
MC_USER_GROUP="minecraft"
MINECRAFT_VER="1.8.9"
JAR_SOURCE="https://s3.amazonaws.com/Minecraft.Download/versions/${MINECRAFT_VER}/minecraft_server.${MINECRAFT_VER}.jar"
MAIN_JAR="minecraft_server.jar"

if [ -z "$(getent passwd ${MC_USER})" ]
then
    echo "User '${MC_USER}' not found. Adding..."
    groupadd ${MC_USER_GROUP}
    useradd -g ${MC_USER_GROUP} ${MC_USER}
    echo ${MC_USER}:${MC_USER_PASSWORD} | chpasswd
else
    echo "User '${MC_USER}' found."
fi

if [ ! -d ${SERVER_ROOT} ]
then
    echo "Path '${SERVER_ROOT}' not found. Creating..."
    mkdir ${SERVER_ROOT}
    chown -R ${MC_USER}:${MC_USER_GROUP} ${SERVER_ROOT}
fi

echo "Downloading jar file..."
wget -nv -O ${SERVER_ROOT}/${MAIN_JAR} ${JAR_SOURCE}
echo "Installing scripts..."
cp $(dirname $0)/minecraft-server.sh /usr/bin/minecraft-server.sh
cp $(dirname $0)/minecraft-server.conf /etc/init/minecraft-server.conf
