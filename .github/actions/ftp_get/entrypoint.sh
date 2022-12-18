#!/bin/sh -l

INPUT_HOST="ftpstanis.telia.com"
lftp $INPUT_HOST -u $INPUT_USER,$INPUT_PASSWORD -e \
"mirror --continue --dereference --exclude=^\.git/$ $INPUT_LOCAL $INPUT_REMOTE; quit"
