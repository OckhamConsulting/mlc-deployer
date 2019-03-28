#!/bin/bash -eux

sudo service postgresql start

export PATH=$PATH:$DEPLOYER_HOME/.nvm/versions/node/v8.9.1/bin

cd $DEPLOYER_HOME
mkdir logs
CHAIN_NAME=$(cat "$CONFIG_PATH" | jq -r '.chainName')
echo N | ./blockchain.sh start-node --name $CHAIN_NAME &>> logs/node.log
./blockchain.sh start-explorer &>> logs/explorer.log

tail -f /dev/null
