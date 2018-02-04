# Helm Client

### Build Status
[![Docker Repository on Quay](https://quay.io/repository/rimusz/k8s-helm/status "Docker Repository on Quay")](https://quay.io/repository/rimusz/k8s-helm)

## Supported tags and respective `Dockerfile` links
* `v2.8.0`, `latest`    [(v2.8.0/Dockerfile)](https://github.com/rimusz/k8s-helm/blob/v2.8.0/Dockerfile)

## Overview
This container provides the Helm client for use with Kubernetes

## Run it
`kubectl run -it helm --image=rimusz/k8s-helm --command /bin/sh -n kube-system --rm=true`
