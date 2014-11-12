#############################################################
# Dockerfile to build Interactive Broker TWS container images
# Based on Ubuntu
#############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER Andrew Pierce

# Update the repository sources list
RUN apt-get update

# Install libs
RUN apt-get install -y \
    wget \
    unzip \
    openjdk-7-jdk \
    gsettings-desktop-schemas \
    xvfb

# Create the directories for IB-related utilities
RUN mkdir -p /opt/ib/darykq

# Download IB Connect and TWS
RUN cd /opt/ib/ ; \
    wget https://github.com/ib-controller/ib-controller/releases/download/2.12.1/IBController-2.12.1.zip ; \
    unzip IBController-2.12.1.zip

RUN cd /opt/ib/ ; \
    wget https://download2.interactivebrokers.com/download/unixmacosx_latest.jar ; \
    jar xf unixmacosx_latest.jar

# Install config files IB needs to run
COPY jts.ini /opt/ib/IBJts/
COPY tws.xml /opt/ib/darykq/
COPY IBController.ini /opt/ib/IBController/
COPY start_tws.sh /opt/ib/
COPY tws_credentials.txt /opt/ib/IBController/
RUN cat /opt/ib/IBController/tws_credentials.txt >> /opt/ib/IBController/IBController.ini

# Set up Virtual Framebuffer and attempt to start TWS
EXPOSE 4001
CMD ["/bin/bash", "/opt/ib/start_tws.sh"]
