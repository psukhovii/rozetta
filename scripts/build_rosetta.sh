#!/usr/bin/env bash

set -o xtrace
set -e

cd ic-master/rs/rosetta-api
cargo build --release --bin ic-rosetta-api

cd ../../
cp rs/target/release/ic-rosetta-api ../scripts/
cp rs/rosetta-api/log_config.yml  ../scripts/