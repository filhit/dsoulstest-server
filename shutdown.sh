#!/usr/bin/env bash

scriptdir=`dirname "$BASH_SOURCE"`
source $scriptdir/secrets.sh
curl --data "" $shutdownwebhook
