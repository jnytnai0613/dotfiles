#!/bin/zsh

if [ ! -e ~/.config ]; then
  mkdir ~/.config
fi

if [ ! -e ~/.config/aqua ]; then
  mkdir ~/.config/aqua
fi

if [ ! -e ~/.aws ]; then
  mkdir ~/.aws
fi

ln -sf $(pwd)/.zshrc ~/.zshrc
ln -sf $(pwd)/.config/starship.toml ~/.config/starship.toml
ln -sf $(pwd)/.config/aqua/aqua.yaml ~/.config/aqua/aqua.yaml
ln -sf $(pwd)/changelog.config.js ~/changelog.config.js
ln -sf $(pwd)/.aws/config ~/.aws/config
ln -sf $(pwd)/.aws/credentials ~/.aws/credentials
ln -sf $(pwd)/.Brewfile ~/.Brewfile