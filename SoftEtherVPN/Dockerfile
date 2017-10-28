# ====================================================================== #
# SoftEtherVPN Docker Image
# ====================================================================== #

# Base image
# ---------------------------------------------------------------------- #
FROM ubuntu:16.04

# Author
# ---------------------------------------------------------------------- #
LABEL maintainer "thyrlian@gmail.com"

ENV DOWNLOAD_LINK http://www.softether-download.com/files/softether/v4.23-9647-beta-2017.10.18-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.23-9647-beta-2017.10.18-linux-x64-64bit.tar.gz

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y build-essential wget && \
    wget -q ${DOWNLOAD_LINK} && \
    tar xvzf *vpn*.tar.gz -C /usr/local && \
    rm *vpn*.tar.gz && \
    cd /usr/local/vpnserver && \
    yes 1 | make && \
    chmod 600 * && \
    chmod 700 vpnserver vpncmd

ADD vpnserver /etc/init.d/
ADD vpnconfig.sh /usr/local/vpnserver
RUN chmod 755 /etc/init.d/vpnserver && \
    chmod 755 /usr/local/vpnserver/vpnconfig.sh

EXPOSE 443/tcp 500/udp 992/tcp 1194/tcp 1194/udp 1701/tcp 4500/udp 5555/tcp
