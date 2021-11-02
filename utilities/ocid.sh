#!/usr/bin/env bash
set -o errexit
set -o pipefail

# This script holds a bunch of utility functions to make working with the oci
# CLI a bit more plesant. They will assume that you are working in a compartment
# whose ocid is stored in OCI_WORKING_COMPARTMENT. These scripts also assume that
# you have authenticated using a token which stores in the profile named
# "token-oci-profile" (as is done by the token_alive.sh script)

# get ocid of compute instance ids using a search term on the display-name
instance() {
    oci compute instance list \
        --config-file "$HOME/.oci/config"\
        --profile "token-oci-profile"\
        --auth security_token\
        --compartment-id "$OCI_WORKING_COMPARTMENT"\
        --all | \
        jq  ".data | .[] | select(.\"display-name\" | contains(\"$1\")) | .id" -r
}

# get ocid of bastion id using a search term on the display-name
bastion() {
    oci bastion bastion list \
        --config-file "$HOME/.oci/config"\
        --profile "token-oci-profile"\
        --auth security_token\
        --compartment-id "$OCI_WORKING_COMPARTMENT"\
        --all | \
        jq  ".data | .[] | select(.\"name\" | contains(\"$1\")) | .id" -r
}


# Check if the function exists (bash specific)
if declare -f "$1" > /dev/null
then
  # call arguments verbatim
  "$@"
else
  # Show a helpful error
  echo "'$1' is not a known function name" >&2
  exit 1
fi
