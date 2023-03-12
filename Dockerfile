FROM ubuntu:16.04
LABEL name="Emercoin 0.7.12" version=1.1 maintainer="Eugene Shumilov <mechnotech@ya.ru>"
RUN apt update && apt install -y wget xz-utils && apt clean -y
ENV EMER_DISTR_VERSION=0.7.12
WORKDIR emer/
RUN wget https://github.com/emercoin/emercoin/releases/download/v${EMER_DISTR_VERSION}emc/emercoin-${EMER_DISTR_VERSION}-x86_64-linux-gnu.tar.xz
RUN tar xf emercoin-${EMER_DISTR_VERSION}-x86_64-linux-gnu.tar.xz
RUN cp emercoin-${EMER_DISTR_VERSION}-x86_64-linux-gnu/emercoind /bin/
RUN rm -r emercoin-${EMER_DISTR_VERSION}-x86_64-linux-gnu && rm emercoin-${EMER_DISTR_VERSION}-x86_64-linux-gnu.tar.xz
COPY ./ .
RUN mkdir /srv/emercoind && cp emercoin.conf.example /srv/emercoind/emercoin.conf

