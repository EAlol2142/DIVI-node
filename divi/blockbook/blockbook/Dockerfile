FROM ubuntu:22.04

RUN set -o errexit -o nounset && apt update && apt upgrade -y 
RUN apt install curl wget net-tools libsnappy1v5 libzmq5 -y \
    && rm -rf /var/cache/apt/

ENV GOSU_VERSION 1.14

RUN wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64" \
    && chmod +x /usr/local/bin/gosu \
    && groupadd noroot --gid 100500\
    && useradd noroot --uid 100500 --gid 100500\
    && gosu nobody true

ENV BLOCKBOOK_DATA /opt/data
ENV BLOCKBOOK_IPORT 9030
ENV BLOCKBOOK_EPORT 9130

RUN set -o errexit -o nounset \
    && mkdir -p ${BLOCKBOOK_DATA} \
    && chown -R noroot ${BLOCKBOOK_DATA}

VOLUME ["/opt/data"]

COPY src/ /opt/
COPY trezor-binary/ /opt/
RUN chown -R noroot:noroot /opt/static

WORKDIR /opt
RUN chmod +x ./blockbook && chmod +x ./run.sh

ENTRYPOINT [ "./run.sh" ]

EXPOSE ${BLOCKBOOK_IPORT}  ${BLOCKBOOK_EPORT}
