FROM ubuntu:22.04

RUN  apt-get update \
    && apt-get install -y wget \
    && rm -rf /var/lib/apt/lists/*

ENV RPC_PORT 8030
ENV WS_PORT 38330
ENV P2P_PORT 22556
ENV RPC_USER rostislav
ENV RPC_PASS hakerman
ENV COIN_VERSION 2.5.1

WORKDIR /opt

RUN wget -O coin.tar.gz https://github.com/DiviProject/Divi/releases/download/v${COIN_VERSION}/divi-${COIN_VERSION}-x86_64-linux.tar.gz \
  && tar -xvf coin.tar.gz \
  && mkdir /coin \
  && mv divi-${COIN_VERSION}/bin/divid /coin/ \
  && chmod +x /coin/divid \
  && rm -rf /opt/*

VOLUME [ "/coin/data" ]

WORKDIR /coin

COPY ./src/coin.conf /coin/coin.conf
COPY ./src/run.sh /coin/run.sh

RUN chmod +x run.sh

ENTRYPOINT [ "./run.sh" ]

EXPOSE ${RPC_PORT} ${WS_PORT} ${P2P_PORT}
