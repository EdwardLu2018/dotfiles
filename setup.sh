# Copy dotfiles
cp .vimrc ~/.vimrc
mkdir ~/.vim/colors/
cp predawn.vim ~/.vim/colors/predawn.vim
cp .tmux.conf ~/.tmux.conf

# Install Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install Packages
git clone https://github.com/Raimondi/delimitMate ~/.vim/bundle/delimitMate
git clone https://github.com/preservim/nerdcommenter ~/.vim/bundle/nerdcommentor
git clone https://github.com/preservim/nerdtree ~/.vim/bundle/nerdtree
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
git clone https://github.com/ackyshake/VimCompletesMe ~/.vim/bundle/VimCompletesMe
git clone --depth 1 https://github.com/sheerun/vim-polyglot ~/.vim/bundle/vim-polyglot
