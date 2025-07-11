#!/bin/bash

# Install oh-my-zsh
if [ -d "~/.oh-my-zsh/" ]
then
    printf "Installing oh-my-zsh...\n"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    printf "Installing zsh-autosuggestions and zsh-syntax-highlighting...\n"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# Copy OMZ patches
echo $ZSH_CUSTOM
cp Predawn.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/Predawn.zsh-theme
cp patches.zsh ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/patches.zsh

# Link dotfiles
ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
if [ ! -d "~/.config/nvim/" ]; then
    mkdir -p ~/.config/nvim
fi
ln -s $(pwd)/init.vim ~/.config/nvim/init.vim

# Link coc-settings.json
ln -s $(pwd)/coc-settings.json ~/.vim/coc-settings.json
ln -s $(pwd)/coc-settings.json ~/.config/nvim/coc-settings.json

# Install vim-plug
if [ ! -e "$HOME/.vim/autoload/plug.vim" ]; then
    printf "Installing vim-plug...\n"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Link color scheme
if [ ! -d "~/.vim/colors/" ]; then
    mkdir -p ~/.vim/colors
fi
ln -s $(pwd)/predawn.vim ~/.vim/colors/predawn.vim

# Link kitty config
if [ ! -d "~/.config/kitty/" ]; then
    mkdir -p ~/.config/kitty
fi
ln -s $(pwd)/kitty/* ~/.config/kitty/

# Install TMUX Plugin Manager
if [ ! -e "$HOME/.tmux/plugins/tpm" ]; then
    printf "Installing TMUX Plugin Manager...\n"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Install TPM plugins.
# TPM requires running tmux server, as soon as `tmux start-server` does not work
# create dump __noop session in detached mode, and kill it when plugins are installed
tmux new -d -s __noop >/dev/null 2>&1 || true
tmux set-environment -g TMUX_PLUGIN_MANAGER_PATH "~/.tmux/plugins"
"$HOME"/.tmux/plugins/tpm/bin/install_plugins || true
tmux kill-session -t __noop >/dev/null 2>&1 || true
