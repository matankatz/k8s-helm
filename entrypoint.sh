#!/usr/bin/env bash

if [[ -n "${LOCAL_TILLER}" ]]; then
    helm init --client-only
    cmd="helm tiller run helm"
else
    helm init
    cmd="helm"
fi

if [[ -n "${PRIVATE_REPO_URL}" ]] && [[ -n "${PRIVATE_REPO_NAME}" ]]; then
    helm repo add ${PRIVATE_REPO_NAME} ${PRIVATE_REPO_URL}
else
    helm repo update
fi

$cmd "$@"