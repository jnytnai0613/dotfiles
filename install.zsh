#!/bin/zsh

#mkdir ~/.config
ln -sf $(pwd)/.zshrc ~/.zshrc
ln -sf $(pwd)/.config/starship.toml ~/.config/starship.toml
ln -sf $(pwd)/.config/aqua.yaml ~/.config/aqua.yaml
ln -sf $(pwd)/changelog.config.js ~/changelog.config.js