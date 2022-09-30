FROM ubuntu:20.04

##################
## Requirements ##
##################
RUN apt-get update && apt-get install -y  wget perl build-essential \
libfontconfig ghostscript && rm -rf /var/lib/apt/lists/*

######################
## Install Tex Live ##
######################
COPY install-tl-unx.tar.gz .
RUN tar xzvf install-tl-unx.tar.gz
WORKDIR /install-tl-20210414/
COPY texlive.profile .
RUN perl install-tl --help
RUN perl install-tl -profile texlive.profile -repository https://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2021/tlnet-final/ && \
sed -i 's/-dBATCH/-dNOSAFER -dBATCH/g' /usr/local/texlive/2021/texmf-dist/dvipdfmx/dvipdfmx.cfg

###################################
## Default: compile dissertation ##
###################################
WORKDIR /dissertation
CMD export PATH="${PATH}:/usr/local/texlive/2021/bin/x86_64-linux" && make
