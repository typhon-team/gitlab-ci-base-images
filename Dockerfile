FROM debian:jessie

MAINTAINER Tech Typhon <tech@typhon.com>

# clamav Installation
RUN apt-get update && apt-get install -y wget clamav clamav-freshclam bsdmainutils git curl clamav-daemon clamdscan

#Maldet Installation
RUN wget http://www.rfxn.com/downloads/maldetect-current.tar.gz
RUN tar -xvzf maldetect-current.tar.gz -C /tmp/
RUN cd /tmp/maldetect-1.*/ && sh /tmp/maldetect-1.*/install.sh

# copy custom conf file
COPY conf/conf.maldet /usr/local/maldetect/
COPY conf/freshclam.conf /etc/clamav/

CMD ["maldet","freshclam","clamscan","clamdscan"]
