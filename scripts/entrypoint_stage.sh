#!/usr/bin/env bash

set -o xtrace
set -e

nginx -g 'daemon off;' > /dev/null 2>&1 &

/usr/local/bin/ic-rosetta-api --canister-id qswkt-jqaaa-aaaak-qaj3a-cai --ic-url https://mainnet.dfinity.network -t OGYt -p 5000 --not-whitelisted