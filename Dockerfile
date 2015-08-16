FROM ubuntu:14.04

RUN apt-get update &&\
    apt-get install -y curl unzip &&\
    rm -rf /var/lib/apt/lists/*

RUN cd /usr/local/bin &&\
    curl -L https://dl.bintray.com/mitchellh/vault/vault_0.2.0_linux_amd64.zip -o install.zip &&\
    export CHKSUM='b4b64fcea765ebfc7cdbae9cdd2c32bff130ca51f15b9cf47194f112fd5515cf' &&\
    [ "$(sha256sum install.zip | awk '{print $1}')" = $CHKSUM ] || exit 11 &&\
    unzip install.zip &&\
    rm install.zip &&\
    curl -L https://github.com/jwilder/dockerize/releases/download/v0.0.2/dockerize-linux-amd64-v0.0.2.tar.gz -o dockerize.tgz &&\
    tar xfz dockerize.tgz

COPY init.sh /init.sh

EXPOSE 8200

ENTRYPOINT ["/init.sh"]
CMD ["vault"]
