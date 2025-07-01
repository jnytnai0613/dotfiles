#!/bin/zsh

mkdir -p ~/.config/aqua
mkdir ~/.aws
ln -sf $(pwd)/.zshrc ~/.zshrc
ln -sf $(pwd)/.config/starship.toml ~/.config/starship.toml
ln -sf $(pwd)/.config/aqua/aqua.yaml ~/.config/aqua/aqua.yaml
ln -sf $(pwd)/changelog.config.js ~/changelog.config.js
ln -sf $(pwd)/.aws/config ~/.aws/config
ln -sf $(pwd)/.aws/credentials ~/.aws/credentials