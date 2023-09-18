#!/bin/bash

# Install oh-my-zsh
if [ -d "~/.oh-my-zsh/" ]
then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Copy dotfiles
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copy theme
mkdir -p ~/.vim/colors/
git clone https://github.com/juanedi/predawn.vim
cp predawn.vim/colors/predawn.vim ~/.vim/colors/predawn.vim
git clone https://github.com/jamiewilson/predawn-shell
cp predawn-shell/Predawn.zsh-theme ~/.oh-my-zsh/themes
rm -rf predawn*
