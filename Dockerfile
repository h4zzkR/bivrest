FROM alpine:latest
LABEL mantainer="myelectronix"

ARG XRAY_CORE_VERSION=v1.8.3

RUN set -e &&\
    apk add bash &&\
    wget https://github.com/XTLS/Xray-core/releases/download/${XRAY_CORE_VERSION}/Xray-linux-64.zip &&\
    mkdir /opt/xray &&\
    mkdir /opt/xray/config &&\
    unzip ./Xray-linux-64.zip -d /opt/xray  &&\
    rm -rf Xray-linux-64.zip

WORKDIR /opt/xray

COPY config.json config/config.json
COPY entrypoint.sh .

RUN chmod +x entrypoint.sh

VOLUME [ "/opt/xray/config" ]
EXPOSE 443
ENTRYPOINT [ "./entrypoint.sh" ]
CMD [ "/bin/sh" ]



