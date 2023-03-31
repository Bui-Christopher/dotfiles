#!/bin/bash

NVIM_DIR="${HOME}/.config/nvim"

git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install nvim packages first
mv $NVIM_DIR/init.lua $NVIM_DIR/final.lua
touch ${HOME}/.config/nvim/init.lua
echo "require('plugins')" > ${HOME}/.config/nvim/init.lua
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
mv ${HOME}/.config/nvim/final.lua ${HOME}/.config/nvim/init.lua
