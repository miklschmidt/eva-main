#!/bin/bash

set -e

if [ "$#" -ne 1 ]; then
    echo "Provide a commit message"
    exit 1
fi

submodules=(
    docs/addons/cartesian_idex 
    docs/addons/fan-ducts 
    docs/addons/mgn15 
    docs/addons/probes 
    docs/addons/x_endstop 
    docs/drives/aero 
    docs/drives/bmg 
    docs/drives/bowden 
    docs/drives/hemera 
    docs/drives/titan
    docs/drives/orbiter
)
path=$(pwd)

for i in "${submodules[@]}"; do
    cd $i
    echo $i
    git add .
    git commit -m "$1" || true
    git push origin main
    cd $path
done
