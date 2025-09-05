#!/bin/zsh

if [ ! -e ~/.config ]; then
  mkdir ~/.config
fi

if [ ! -e ~/.config/aqua ]; then
  mkdir ~/.config/aqua
fi

if [ ! -e ~/.config/brew ]; then
  mkdir ~/.config/brew
fi

if [ ! -e ~/.config/krew ]; then
  mkdir ~/.config/krew
fi

if [ ! -e ~/.aws ]; then
  mkdir ~/.aws
fi

ln -sf $(pwd)/.zshrc ~/.zshrc
ln -sf $(pwd)/.config/starship.toml ~/.config/starship.toml
ln -sf $(pwd)/.config/aqua/aqua.yaml ~/.config/aqua/aqua.yaml
ln -sf $(pwd)/.config/brew/brewfile ~/.config/brew/brewfile
ln -sf $(pwd)/.config/krew/krewfile ~/.config/krew/krewfile
ln -sf $(pwd)/changelog.config.js ~/changelog.config.js
ln -sf $(pwd)/.aws/config ~/.aws/config
ln -sf $(pwd)/.aws/credentials ~/.aws/credentials
# リンク先ディレクトリは環境に合わせて、適宜変更するよう注意
# ln -sf $(pwd)/vscode/setting.json /Users/"username"/Library/Application\ Support/Code/User/settings.json
# ln -sf $(pwd)/vscode/mcp.json /Users/"username"/Library/Application\ Support/Code/User/mcp.json
