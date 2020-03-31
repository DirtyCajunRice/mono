FROM ubuntu:18.04

LABEL maintainer="dirtycajunrice"

RUN \
 echo "**** install prereqs ****" && \
 apt-get update && apt-get install -y gnupg curl apt-transport-https && \
 echo "**** add mono repository ****" && \
 apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
 echo "deb http://download.mono-project.com/repo/ubuntu bionic main" | tee /etc/apt/sources.list.d/mono-official.list && \
 echo "**** add mediaarea repository ****" && \
 curl -L "https://mediaarea.net/repo/deb/repo-mediaarea_1.0-12_all.deb" -o /tmp/key.deb && dpkg -i /tmp/key.deb && \
 echo "deb https://mediaarea.net/repo/deb/ubuntu bionic main" | tee /etc/apt/sources.list.d/mediaarea.list && \
 echo "**** install packages ****" && \
 apt-get update && apt-get install -y --no-install-recommends --no-install-suggests ca-certificates-mono mediainfo mono-devel sqlite3 && \ 
 echo "**** clean up ****" && \
 rm -rf	/tmp/* /var/lib/apt/lists/* /var/tmp/*
