#!/bin/sh

set -o errexit -o nounset

# if bridge config already exists then exit early
if [ -f "$home_dir/bridge/config.toml" ]; then
  exit 0
fi

celestia bridge init \
  --node.store "$home_dir/bridge" \
  --core.ip celestia-service \
  --core.rpc.port $celestia_app_rpc_port \
  --gateway.port $bridge_host_port
cp -r "$home_dir/keyring-test" "$home_dir/bridge/keys/"
