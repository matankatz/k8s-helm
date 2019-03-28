FROM alpine

MAINTAINER Rimas Mocevicius <rmocius@gmail.com>

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/rimusz/k8s-helm" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"

ENV HELM_LATEST_VERSION v2.10.0
ENV TILLER_VERSION v0.6.8

RUN apk add --update ca-certificates \
 && apk add --update -t deps wget \
 && apk add --update bash \
 && wget http://storage.googleapis.com/kubernetes-helm/helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && tar -xvf helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && apk del --purge deps \
 && rm /var/cache/apk/* \
 && rm -f /helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && wget https://github.com/rimusz/helm-tiller/archive/${TILLER_VERSION}.tar.gz \
 && mkdir -p $(helm home)/plugins \
 && tar -C $(helm home)/plugins -xvf ${TILLER_VERSION}.tar.gz \
 && rm -f ${TILLER_VERSION}.tar.gz

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["help"]
