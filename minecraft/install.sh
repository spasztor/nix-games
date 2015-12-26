#!/bin/bash
SERVER_ROOT="/srv/minecraft"
MC_USER="minecraft"
MC_USER_PASSWORD="minecraft"
MC_USER_GROUP="minecraft"
MINECRAFT_VER="1.8.9"
JAR_SOURCE="https://s3.amazonaws.com/Minecraft.Download/versions/${MINECRAFT_VER}/minecraft_server.${MINECRAFT_VER}.jar"
MAIN_JAR="minecraft_server.jar"

#if [id -u ${MC_USER} &>/dev/null]; then
    #groupadd ${MC_USER_GROUP}
    #adduser ${MC_USER} ${MC_GROUP}
    #echo ${MC_USER_PASSWORD} | passwd ${MC_USER} --stdin
    #sudo chown -R ${MC_USER}:${MC_GROUP} ${SERVER_ROOT}
#fi

if [! -d ${SERVER_ROOT}]; then
    mkdir ${SERVER_ROOT}
    chown -R ${MC_USER}:${MC_USER_GROUP} ${SERVER_ROOT}
fi

wget --output-document=${SERVER_ROOT}/${MAIN_JAR} ${JAR_SOURCE}
cp ./minecraft-server.sh ${SERVER_ROOT}/minecraft-server.sh
cp ./minecraft-server.conf /etc/init/minecraft-server.conf
