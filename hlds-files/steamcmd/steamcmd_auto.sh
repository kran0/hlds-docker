#!/bin/sh

set -x

STEAMCMD="$(dirname $0)/steamcmd.sh"
[ -f "${STEAMCMD}" ] || exit 1

#"${STEAMCMD}" "$@" "+quit" || $0 $@

"${STEAMCMD}" "$@" "+quit" && exit 0

export RETRY=$(($RETRY+1))
MAXRETRY=10
[ ${RETRY} -gt ${MAXRETRY} ] && exit 1
$0 $@
