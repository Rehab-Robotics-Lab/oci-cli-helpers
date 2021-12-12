#!/usr/bin/env bash
set -o errexit
set -o pipefail

## Authenticate an OCI session and keep it alive. As long as this is running
## (up to 24 hours), your token should work.


oci session authenticate --region us-ashburn-1 --tenancy-name 'upennrehabrobotics' --profile-name 'token-oci-profile'

echo '

Authentication done. To use token with oci-cli commands, export the following into your shell:
export OCI_CLI_PROFILE='"'"'token-oci-profile'"'"'
export OCI_CLI_CONFIG_FILE="$HOME/.oci/config"
export OCI_CLI_AUTH='"'"'security_token'"'"'
'

while :
do
    sleep $((  60*55  )) # 60 sec * 55 minutes
    oci session refresh --profile 'token-oci-profile'
done
