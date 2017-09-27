mkdir ~/src
git clone https://github.com/swapsCAPS/teh-awesome-vim-setup.git ~/src/teh-awesome-vim-setup
mkdir -p ~/.config/nvim/
ln -sf ~/src/teh-awesome-vim-setup/.vimrc ~/.vimrc
ln -sf ~/src/teh-awesome-vim-setup/.vimrc ~/.config/nvim/init.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip2 install neovim
pip3 install neovim
