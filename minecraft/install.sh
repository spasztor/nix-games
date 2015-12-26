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
    echo "${MC_USER} user not found. Adding..."
    groupadd ${MC_USER_GROUP}
    useradd -g ${MC_USER_GROUP} ${MC_USER}
    echo ${MC_USER}:${MC_USER_PASSWORD} | chpasswd
else
    echo "${MC_USER} user found."
fi

if [ ! -d ${SERVER_ROOT} ]
then
    echo "${SERVER_ROOT} not found. Creating..."
    mkdir ${SERVER_ROOT}
    chown -R ${MC_USER}:${MC_USER_GROUP} ${SERVER_ROOT}
fi

echo "Downloading jar file..."
#wget -O ${SERVER_ROOT}/${MAIN_JAR} ${JAR_SOURCE}
echo "Installing scripts..."
echo $(dirname "$BASH_SOURCE")
#cp $(dirname "$BASH_SOURCE")./minecraft-server.sh ${SERVER_ROOT}/minecraft-server.sh
#cp $(dirname "$BASH_SOURCE")./minecraft-server.conf /etc/init/minecraft-server.conf
