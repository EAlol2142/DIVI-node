#!/bin/bash
set -e

find /opt/data -type d -print0 | xargs -0 chmod -v 700
[ "$(ls -A /opt/data)" ] && find /opt/data -type f -print0 | xargs -0 chmod -v 600 || echo "Empty"
chown -R noroot /opt/data

exec gosu noroot ./blockbook -sync -blockchaincfg ./coin.json -internal 0.0.0.0:${BLOCKBOOK_IPORT} -public 0.0.0.0:${BLOCKBOOK_EPORT} -logtostderr -dbmaxopenfiles 80000 $@