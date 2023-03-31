#!/bin/bash

curl -s https://sh.rustup.rs > rust.sh
sh rust.sh -y && rm rust.sh
rustup default stable
rustup toolchain install nightly
rustup +nightly component add rust-src rust-analyzer-preview

ln -s ${HOME}/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rust-analyzer \
 /usr/local/bin/rust-analyzer
