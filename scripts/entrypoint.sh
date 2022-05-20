#!/usr/bin/env bash

set -o xtrace
set -e

nginx -g 'daemon off;' > /dev/null 2>&1 &

/usr/local/bin/ic-rosetta-api --canister-id ${LEDGER_CANISTER_ID} --ic-url https://mainnet.dfinity.network -t ${TOKEN} -p 5000 --not-whitelisted