# OCI Authentication

Tools for managing token based authentication

## Authenticating

You can run `./oci-cli-helper/auth/token-alive.sh` to authenticate with the
upennrehabrobotics tennancy. Running the script should open up your default
web browser where you can login. You should leave the script running somewhere,
every 55 minutes it will try to refresh the token. In theory it can do that
for 24 hours (in reality it rarely works that long).

## Running Commands

Once you have authenticated with the `token-alive.sh`, any oci commands that you
want to run will need a few parameters specified. To make this easier, the 
`oci-token-run.sh` file provides a function `oci-token` which will run commands
as if it were `oci` but with the necessary parameters set. You can source this 
file when you need to command or source it from your shell's dotfile(s) to have
it available always. Then just type `oci-token` as you would `oci`.
