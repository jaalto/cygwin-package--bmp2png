#!/bin/sh
#
# Depends: sharutils (uudecode)

set -e

TMPDIR=${TMPDIR:-/tmp}
TMPBASE=$TMPDIR/tmp.$$
CURDIR=.

case "$0" in
  */*) 
	CURDIR=${CURDIR%/*}
	;;
esac			

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


orig="$CURDIR/pic.bmp.uu"
bmp="$TMPBASE-pic-test.bmp"
png="$TMPBASE-pic-test.png"

uudecode -o "$bmp" "$orig"

Run "%% TEST bmp2png:" bmp2png -o "$png" "$bmp"

Run "%% TEST png2bmp:" png2bmp "$png"

# End of file
