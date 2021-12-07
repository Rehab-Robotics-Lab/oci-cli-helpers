# OCI General Utilities

## SSH

Use `oci-ssh.sh` to facilitate remote access to instances using the bastion service

### Setup

1.  Create a new bastion on the web client
2.  Enable bastion on the instance, place instance in the private subnet that the bastion can access, no need to have ssh keys
3.  Give the user the necessary permissions to:
    *   get metadata about the target instance
    *   get target instance instance-agent plugin information
    *   list bastions within the compartment
    *   create, delete, and view bastion sessions on the bastion that will be used

### Run

1.  Turn on instance
2.  Authenticate a session (you can use `oci-cli-helpers/auth/token-alive.sh`)
3.  Connect using the OCID of the target instance: `./oci-cli-helpers/utilities/oci-ssh.sh <ocid>` (you can use the ocid helper described below to help with this: `./oci-cli-helpers/utilities/oci-ssh.sh $(./oci-cli-helpers/utilities/ocid.sh instance <instance name>)`)

## OCID

Use `ocid.sh` to get the OCID of common resources

Will expect a few things:

1.  The resources you are looking for are in a compartment whose OCID is
    stored in `$OCI_WORKING_COMPARTMENT`, which is exported.
    I just do this in my dotfiles.
2.  You have authenticated using token authentication using
    `./oci-cli-helpers/auth/token-alive.sh`

### Instance

Retrieve the OCID of an instance. This will search for the instance name
passed in by:

1.  filtering by only instances that are running
2.  filtering to instances in which the display-name contains the passed in
    argument
3.  selects the first instance that satisfies the first two conditions

`./oci-cli-helpers/utilities/ocid.sh instance <instance name>`

### Bastion

Retrieve the OCID of a bastion. This will search for the bastion name
passed in by:

1.  filtering to bastions in which the name contains the passed in argument
2.  selects the first instance that satisfies the first condition

`./oci-cli-helpers/utilities/ocid.sh bastion <bastion name>`
