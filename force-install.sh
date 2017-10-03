mkdir ~/src
mkdir -p ~/.config/nvim/
ln -sf ~/src/teh-awesome-vim-setup/.vimrc ~/.vimrc
ln -sf ~/src/teh-awesome-vim-setup/.vimrc ~/.config/nvim/init.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip  install --user --upgrade grip
pip2 install --user --upgrade neovim
pip3 install --user --upgrade neovim
