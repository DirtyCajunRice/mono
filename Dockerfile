FROM ubuntu:18.04
MAINTAINER dirtycajunrice

ARG VERSION

RUN \
 # Install prereqs
 apt-get update && apt-get install -y gnupg curl apt-transport-https && \
 # Add repositories
 apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
 echo "deb http://download.mono-project.com/repo/ubuntu bionic main" | tee /etc/apt/sources.list.d/mono-official.list && \
 curl -L "https://mediaarea.net/repo/deb/repo-mediaarea_1.0-12_all.deb" -o /tmp/key.deb && dpkg -i /tmp/key.deb && \
 echo "deb https://mediaarea.net/repo/deb/ubuntu bionic main" | tee /etc/apt/sources.list.d/mediaarea.list && \
 # Install packages
 apt-get update && apt-get install -y --no-install-recommends --no-install-suggests ca-certificates-mono mediainfo mono-devel=${VERSION} sqlite3 && \
 $ Cleanup
 rm -rf	/tmp/* /var/lib/apt/lists/* /var/tmp/*
