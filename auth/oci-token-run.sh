#!/usr/bin/env bash

oci-token() {
    oci "$@" \
    --config-file "$HOME/.oci/config"\
    --profile 'token-oci-profile'\
    --auth security_token
}
