FROM alpine:latest
LABEL mantainer="h4zzkR"

ARG XRAY_CORE_VERSION=v1.8.4

RUN set -e &&\
    apk add --no-cache bash libqrencode curl &&\
    wget https://github.com/XTLS/Xray-core/releases/download/${XRAY_CORE_VERSION}/Xray-linux-64.zip &&\
    mkdir /opt/xray &&\
    mkdir /opt/xray/config &&\
    unzip ./Xray-linux-64.zip -d /opt/xray  &&\
    rm -rf Xray-linux-64.zip

WORKDIR /opt/xray

COPY get-client-qr.sh .
COPY get-client-settings.sh .
COPY regenerate-client-settings.sh .
COPY entrypoint.sh .

EXPOSE 1986
ENTRYPOINT [ "/bin/bash","./entrypoint.sh" ]




