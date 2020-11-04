FROM ubuntu:16.04
LABEL name="Emercoin 0.7.10 Fast Start" version=1
WORKDIR /emer
RUN mkdir /root/.emercoin
COPY ./.emercoin ../root/.emercoin
COPY bin ./bin
COPY changepass.sh .
EXPOSE 6662
EXPOSE 6661
CMD ./bin/emercoind