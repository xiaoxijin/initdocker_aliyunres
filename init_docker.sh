#!/usr/bin/bash


echo "[docker-main-repo]
name=Docker main Repository
baseurl=http://mirrors.aliyun.com/docker-engine/yum/repo/main/centos/7
enabled=1
gpgcheck=1
gpgkey=http://mirrors.aliyun.com/docker-engine/yum/gpg" > /etc/yum.repos.d/docker-main.repo



curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sh -

systemctl restart docker
cp -n /lib/systemd/system/docker.service /etc/systemd/system/docker.service

sudo sed -i "s|ExecStart=/usr/bin/dockerd|ExecStart=/usr/bin/docker daemon --registry-mirror=https://szz5mfpe.mirror.aliyuncs.com|g" /etc/systemd/system/docker.service

systemctl daemon-reload

systemctl restart docker