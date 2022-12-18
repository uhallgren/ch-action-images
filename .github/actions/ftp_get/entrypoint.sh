#!/bin/sh -l

# Predefined Hostname
INPUT_HOST="ftpstanis.telia.com"

# Make sure that the local folder exists
mkdir -p  $INPUT_LOCAL

# Perform the mirroring
lftp $INPUT_HOST -u $INPUT_USER,$INPUT_PASSWORD -e \
"mirror --continue --dereference --exclude=^\.git/$ $INPUT_LOCAL $INPUT_REMOTE; quit"
