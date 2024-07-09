#!/bin/bash

# Checkout the version
ori_dir=$(pwd)
cd /root/.cache/SaprotHub/SaprotHub
local=$(git rev-parse HEAD)
remote=$(git ls-remote https://github.com/westlake-repl/SaprotHub.git | grep HEAD)
remote=(${remote//,/ }[0])
if [ "$local" != "$remote" ]; then
    echo "The version is not the latest. Updating..."
    git pull
    pip install -r ./requirements.txt

fi
local=$(git rev-parse HEAD)

# Run the server
source activate SaprotHub
jupyter notebook --config $ori_dir/jupyter_notebook_config.py --allow-root