# dotfiles

This is a homes(h)ick repository for my personal configuration.

To get bootstrapped (assuming Ubuntu):

```
sudo apt-get update
sudo apt-get install -y keychain vim-nox
git clone git://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
source ~/.homesick/repos/homeshick/homeshick.sh
homeshick clone git@github.com:mark-burnett/dotfiles.git

vim +PluginInstall +qall
```
