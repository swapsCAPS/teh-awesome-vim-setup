ln -sf ~/src/teh-awesome-vim-setup/.vim   ~/.vim
ln -sf ~/src/teh-awesome-vim-setup/.vimrc ~/.vimrc
ln -sf ~/src/teh-awesome-vim-setup/.vim   ~/.config/nvim
ln -sf ~/.vimrc ~/.config/nvim/init.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/src/teh-awesome-vim-setup/.vim/bundle/Vundle.vim
pip2 install neovim
pip3 install neovim
cd ~/src/teh-awesome-vim-setup/.vim/bundle/YouCompleteMe/
./install.py --tern-completer
cd ~/src/teh-awesome-vim-setup
