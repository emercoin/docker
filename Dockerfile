FROM ubuntu:16.04
LABEL name="Emercoin 0.7.11" version=1
WORKDIR /emer
COPY ./ .
RUN mkdir /srv/emercoind && cp emercoin.conf /srv/emercoind

