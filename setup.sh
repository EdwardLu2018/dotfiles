#!/bin/bash

# Install oh-my-zsh
if [ ! -d ~/.oh-my-zsh/ ]
then
    printf "Installing oh-my-zsh...\n"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    printf "Installing zsh-autosuggestions and zsh-syntax-highlighting...\n"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# Add zsh-autosuggestions and zsh-syntax-highlighting to plugins in .zshrc if missing
for plugin in zsh-autosuggestions zsh-syntax-highlighting; do
    if ! grep -q "$plugin" ~/.zshrc 2>/dev/null; then
        sed -i "s/^plugins=(\(.*\))/plugins=(\1 $plugin)/" ~/.zshrc
    fi
done

# Copy OMZ patches
cp Predawn.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/Predawn.zsh-theme
cp patches.zsh ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/patches.zsh

# Link dotfiles
ln -sf $(pwd)/.vimrc ~/.vimrc
ln -sf $(pwd)/tmux.conf ~/.tmux.conf
mkdir -p ~/.config/nvim
ln -sf $(pwd)/init.vim ~/.config/nvim/init.vim

# Link coc-settings.json
mkdir -p ~/.vim
ln -sf $(pwd)/coc-settings.json ~/.vim/coc-settings.json
ln -sf $(pwd)/coc-settings.json ~/.config/nvim/coc-settings.json

# Install vim-plug
if [ ! -e "$HOME/.vim/autoload/plug.vim" ]; then
    printf "Installing vim-plug...\n"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Link color scheme
mkdir -p ~/.vim/colors
ln -sf $(pwd)/predawn.vim ~/.vim/colors/predawn.vim

# Link alacritty config
mkdir -p ~/.config/alacritty
ln -sf $(pwd)/alacritty/* ~/.config/alacritty/

# Link kitty config
mkdir -p ~/.config/kitty
ln -sf $(pwd)/kitty/* ~/.config/kitty/

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
