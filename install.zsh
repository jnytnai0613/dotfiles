#!/bin/zsh

mkdir ~/.config
ln -sf $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/.config/starship.toml ~/.config/starship.toml
ln -s $(pwd)/.config/aqua.yaml ~/.config/aqua.yaml
ln -s $(pwd)/changelog.config.js ~/changelog.config.js