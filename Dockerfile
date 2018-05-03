FROM debian:wheezy

MAINTAINER Tech Typhon <tech@typhon.com>

# clamav Installation
RUN apt-get update && apt-get install -y wget clamav clamav-freshclam bsdmainutils git

#Maldet Installation
RUN wget http://www.rfxn.com/downloads/maldetect-current.tar.gz
RUN tar -xvzf maldetect-current.tar.gz -C /tmp/
WORKDIR /tmp/maldetect-1.6/
RUN /tmp/maldetect-1.*/install.sh

# copy custom conf file
COPY conf/conf.maldet /usr/local/maldetect/
COPY conf/freshclam.conf /etc/clamav/

# Init signature loading
RUN freshclam
RUN maldet -u

CMD ["maldet","freshclam","clamscan","clamdscan"]
