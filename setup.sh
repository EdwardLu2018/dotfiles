#!/bin/bash

# Install oh-my-zsh
if [ -d "~/.oh-my-zsh/" ]
then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Copy dotfiles
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf

# Install Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install vim Packages
git clone https://github.com/Raimondi/delimitMate ~/.vim/bundle/delimitMate
git clone https://github.com/preservim/nerdcommenter ~/.vim/bundle/nerdcommentor
git clone https://github.com/preservim/nerdtree ~/.vim/bundle/nerdtree
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
git clone https://github.com/vim-scripts/VimCompletesMe ~/.vim/bundle/VimCompletesMe
git clone https://github.com/tmhedberg/matchit ~/.vim/bundle/matchit
git clone https://github.com/sheerun/vim-polyglot ~/.vim/bundle/vim-polyglot
git clone https://github.com/junegunn/fzf ~/.vim/bundle/fzf
git clone https://github.com/junegunn/fzf.vim ~/.vim/bundle/fzf.vim
git clone https://github.com/airblade/vim-gitgutter ~/.vim/bundle/vim-gitgutter
git clone https://github.com/terryma/vim-multiple-cursors ~/.vim/bundle/vim-multiple-cursors

# Copy theme
mkdir ~/.vim/colors/
git clone https://github.com/juanedi/predawn.vim
cp predawn.vim/colors/predawn.vim ~/.vim/colors/predawn.vim
git clone https://github.com/jamiewilson/predawn-shell
cp predawn-shell/Predawn.zsh-theme ~/.oh-my-zsh/themes
rm -rf predawn*
