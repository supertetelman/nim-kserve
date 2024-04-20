#!/bin/bash

# Creates a secret used to pull down private NGC containers

# Check if NGC_API_KEY is empty
if [ -z "$NGC_API_KEY" ]; then
    echo "Warning: NGC_API_KEY is not set. Run 'export NGC_API_KEY=xxxyyyzzz' before creating secret."
    exit 1
fi

# If you are not using default namespace you may need to create this secret in the proper namespace
kubectl create secret docker-registry ngc-secret \
 --docker-server=nvcr.io\
 --docker-username='$oauthtoken'\
 --docker-password=${NGC_API_KEY}
