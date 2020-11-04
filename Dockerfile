FROM ubuntu:16.04
LABEL name="Emercoin 0.7.10" version=1
WORKDIR /emer
COPY ./ .
RUN mkdir /root/.emercoin && cp emercoin.conf /root/.emercoin/
EXPOSE 6662
EXPOSE 6661
CMD ./bin/emercoind
