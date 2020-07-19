FROM ubuntu:focal
MAINTAINER dirtycajunrice

ARG VERSION

RUN \
 # Install prereqs
 apt-get update && \
 apt-get install -y ca-certificates gnupg apt-transport-https && \
 # Add repositories
 apt-key adv \
   --keyserver hkp://keyserver.ubuntu.com \
   --recv-keys \
     3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
     C5CDF62C7AE05CC847657390C10E11090EC0E438 && \
 echo "deb http://download.mono-project.com/repo/ubuntu stable-focal main" > \
   /etc/apt/sources.list.d/mono-official-stable.list && \
 echo "deb https://mediaarea.net/repo/deb/ubuntu focal main" > \
   /etc/apt/sources.list.d/mediaarea.list && \
 # Install packages
 apt-get update && \
 apt-get install -y \
   --no-install-recommends \
   --no-install-suggests \
   ca-certificates-mono mediainfo mono-devel=${VERSION} && \
 # Cleanup
 rm -rf	/tmp/* /var/lib/apt/lists/* /var/tmp/*
