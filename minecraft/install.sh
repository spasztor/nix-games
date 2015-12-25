#!/bin/bash
SERVER_ROOT="/srv/minecraft"
MC_USER="minecraft"
MC_USER_GROUP="minecraft"
MINECRAFT_VER="1.8.9"
JAR_SOURCE="https://s3.amazonaws.com/Minecraft.Download/versions/${MINECRAFT_VER}/minecraft_server.${MINECRAFT_VER}.jar"
MAIN_JAR="minecraft_server.jar"

#id -u ${MC_USER} &>/dev/null || adduser --system --no-create-home --home ${SERVER_ROOT} ${MC_USER}
#sudo useradd ${MC_USER_GROUP} -d ${SERVER_ROOT}
#sudo adduser ${MC_USER} ${MC_GROUP}
#sudo chown -R ${MC_USER}:${MC_GROUP} ${SERVER_ROOT}

wget --output-document=${SERVER_ROOT}/${MAIN_JAR} ${JAR_SOURCE}
cp ./minecraft-server.sh ${SERVER_ROOT}/minecraft-server.sh
cp ./minecraft-server.conf /init/minecraft-server.conf
