#!/bin/bash

if [[ -n "$PUBLIC_KEY" ]]; then
    if ! grep -q "${PUBLIC_KEY}" /home/devpod/.ssh/authorized_keys; then
        echo "$PUBLIC_KEY" >> /home/devpod/.ssh/authorized_keys
        echo "Public key from env variable added"
    fi
fi

service ssh start
