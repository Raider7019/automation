#!/bin/bash
# reckeys.sh
# Requires jq commandline JSON parser 
# sudo apt install jq

NODEROOT="$HOME/.terra"
NODENAME="test-node"
PASSPHRASE="12345678"
RECSEED="torch swamp cancel lift never october child harsh rib aspect luxury word peanut length bamboo hawk material vehicle glue above west random sketch author"

# Determine if keys for this node already exist
if [ -f "$NODEROOT/$NODENAME.info" ]
then
    echo "Keys for $NODENAME are already present in $NODEROOT"
else
    # Create the validator node keys and wallet address and capture the output as a JSON string
    JDATA=`(printf "%s\n%s\n" "$RECSEED" "$PASSPHRASE" | terrad keys add "$NODENAME" --output json --recover)`

    # Dump the full JSON to stdout only for demonstration purposes
    echo $JDATA | jq

    # Parse the main JSON output
    read type address pubkey < <(echo $(echo $JDATA | jq --raw-output '.type, .address, .pubkey'))

    # Parse the pubkey JSON output
    read kt kv < <(echo $(echo $pubkey | jq '.["@type"], .key'))

    # Trim redundant quotation marks from the pubkey and keytype
    KEYTYPE=`echo $kt | tr -d '"'`
    KEY=`echo $kv | tr -d '"'`

    echo "Type: $type"
    echo "Address: $address"
    echo "Key type: $KEYTYPE"
    echo "Key: $KEY"
fi
