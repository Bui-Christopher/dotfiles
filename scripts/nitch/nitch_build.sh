#!/bin/sh

CURR_DIR=`pwd`
NITCH_DIR=$HOME/.config/nitch

cd $NITCH_DIR 

echo ""

cp $CURR_DIR/drawing.nim $NITCH_DIR/src/funcs/
nimble build
chmod +x nitch
sudo mv $NITCH_DIR/nitch /usr/local/bin/nitch
