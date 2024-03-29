#!/bin/bash

# Run the script within directory to autopull

REPOS=`pwd`

for REPO in `ls "$REPOS/"`
do
    if [ -d "$REPOS/$REPO" ]
    then
        echo "Updating $REPOS/$REPO"
        if [ -d "$REPOS/$REPO/.git" ]
        then
            cd "$REPOS/$REPO"
            git fetch
            git pull
        else
            echo "Skipping.. No .git folder found"
        fi
        echo "Done"
        echo
    fi
done
