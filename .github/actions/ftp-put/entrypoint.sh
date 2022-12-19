#!/bin/sh -l

# Predefined Hostname
INPUT_HOST="ftpstanis.telia.com"


# Perform the mirroring
lftp $INPUT_HOST -u $INPUT_USER,$INPUT_PASSWORD -e \
"mirror --continue --dereference --exclude=^\.git/$ --reverse $INPUT_LOCAL $INPUT_REMOTE; quit"
