#!/bin/zsh

if ! which brew; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install aqua
brew install awscli
brew install tree
brew install wget
brew install node

npm install -g git-cz

if [ -e ~/.zshrc ]; then
    cp ~/.zshrc ~/.zshrc.bak
    echo '######################################'
    echo 'Backup of ~/.zshrc as ~/.zshrc.bak'
    echo '######################################'
fi