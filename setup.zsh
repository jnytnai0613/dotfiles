#!/bin/zsh

brew bundle --global --file=~/.Brewfile
npm install -g git-cz

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

if [ -e ~/.zshrc ]; then
    cp ~/.zshrc ~/.zshrc.bak
    echo '######################################'
    echo 'Backup of ~/.zshrc as ~/.zshrc.bak'
    echo '######################################'
fi