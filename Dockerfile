FROM ubuntu:16.04
LABEL name="Emercoin 0.7.10" version=1
WORKDIR /emer
COPY ./ .
RUN mkdir /srv/emercoind && cp emercoin.conf /srv/emercoind
EXPOSE 6662
EXPOSE 6661
CMD ./bin/emercoind -datadir=/srv/emercoind -conf=/srv/emercoind/emercoin.conf
