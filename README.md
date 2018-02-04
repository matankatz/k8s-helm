# Helm Client

### CircleCI Build Status
[![CircleCI](https://circleci.com/gh/rimusz/k8s-helm.svg?style=svg)](https://circleci.com/gh/rimusz/k8s-helm)

### Container Details
[![](https://images.microbadger.com/badges/image/rimusz/k8s-helm.svg)](http://microbadger.com/images/rimusz/k8s-helm "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/rimusz/k8s-helm.svg)](http://microbadger.com/images/rimusz/k8s-helm "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/rimusz/k8s-helm.svg)](http://microbadger.com/images/rimusz/k8s-helm "Get your own commit badge on microbadger.com")

# Supported tags and respective `Dockerfile` links
* `v2.8.0`, `latest`    [(v2.8.0/Dockerfile)](https://github.com/rimusz/k8s-helm/blob/v2.8.0/Dockerfile)

## Overview
This container provides the Helm client for use with Kubernetes

## Run it
`kubectl run -it helm --image=rimusz/k8s-helm --command /bin/sh -n kube-system --rm=true`
