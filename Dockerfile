#
# Install CODESYS on a plain ubuntu container
#
FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y unzip

#
# copy CODESYS package
#
COPY . /codesys


# download package and extract it
RUN unzip -p codesys/codesys.package '*codemeter*.deb' > codemeter.deb && \
    unzip -p codesys/codesys.package '*codesys*.deb' > codesys.deb


# install
RUN apt-get install -y ./codemeter.deb
RUN apt-get install -y ./codesys.deb

WORKDIR /var/opt/codesys/
CMD [ "/opt/codesys/bin/codesyscontrol.bin", "/etc/CODESYSControl.cfg"]
