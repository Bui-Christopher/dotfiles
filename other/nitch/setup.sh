#!/bin/sh
cd ~/.config/nitch

echo ""

nimble build
chmod +x nitch
sudo mv ~/.config/nitch/nitch /usr/local/bin/nitch
