#!/bin/bash
# author: xlpmg
if [ -z "$1" ]; then
    echo "Please provide the new AnimationFrameTime value."
    exit 1
fi

newValue=$1
jsonFile="content.json"
if [ ! -f "$jsonFile" ]; then
    echo "JSON not found!"
    exit 1
fi

sed -i '' -e "s/\"AnimationFrameTime\": [0-9]*/\"AnimationFrameTime\": $newValue/g" "$jsonFile"

echo "AnimationFrameTime updated to $newValue."