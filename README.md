# teh-awesome-vim-setup

<img src="https://github.com/swapsCAPS/teh-awesome-vim-setup/blob/master/screenshot.png" width="800" />

### Install for Neovim
```bash
mkdir ~/src
git clone https://github.com/swapsCAPS/teh-awesome-vim-setup.git ~/src/teh-awesome-vim-setup
mkdir -p ~/.config/nvim
ln -s ~/src/teh-awesome-vim-setup/.vimrc ~/.vimrc
ln -s ~/src/teh-awesome-vim-setup/.vimrc ~/.config/nvim/init.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip  install --user --upgrade grip
pip2 install --user --upgrade neovim
pip3 install --user --upgrade neovim
gem install neovim
nvim
:CheckHealth
:PlugInstall
```
