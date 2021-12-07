#!/usr/bin/env bash

## From Oracle:
## coding: utf-8
## Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.
## This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

#_oci_completion() {
#    COMPREPLY=( $( env COMP_WORDS="${COMP_WORDS[*]}" \
#                   COMP_CWORD=$COMP_CWORD \
#                   _OCI_COMPLETE=complete $1 ) )
#    return 0
#}

#complete -F _oci_completion -o default oci;


_oci_token_completion() {
	COMPREPLY=($( env COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   _OCI_COMPLETE=complete oci ))
	return 0
}

oci-token() {
    oci "$@" \
    --config-file "$HOME/.oci/config"\
    --profile 'token-oci-profile'\
    --auth security_token
}

#complete -r oci-token
# for bash
complete -F _oci_token_completion -o default oci-token
# for zsh
#compdef _oci_token_completion oci-token
