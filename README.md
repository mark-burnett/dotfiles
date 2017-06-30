# dotfiles

This is a homes(h)ick repository for my personal configuration.

To get bootstrapped (assuming Ubuntu):

```
sudo apt-get update
sudo apt-get install -y keychain vim-nox
# pyenv/build dependencies
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev

git clone git://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv


source ~/.homesick/repos/homeshick/homeshick.sh
homeshick clone git@github.com:mark-burnett/dotfiles.git

vim +PluginInstall +qall
```
