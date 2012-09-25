#!/bin/sh

set -e

TMPBASE=$TMPDIR/tmp.$$
CURDIR=$0
CURDIR=${CURDIR%/*}

TMPDIR=${TMPDIR:-/tmp}

AtExit ()
{
  rm -f "$TMPBASE"*
}

Run ()
{
    echo "$*"
    shift
    eval "$@"
}

trap AtExit 0 1 2 3 15

# #######################################################################

file="$TMPBASE-pic-test.png"

Run "%% TEST bmp2png:"  bmp2png -o "$file" "$CURDIR/pic.bmp"

Run "%% TEST png2bmp:" png2bmp "$file"

# End of file
