#!/usr/bin/env sh

rm -f $HOME/.profile
ln -s $PWD/profile $HOME/.profile

rm -f $HOME/.config/i3/config
ln -s $PWD/i3config $HOME/.config/i3/config

rm -f $HOME/.vimrc
ln -s $PWD/vimrc $HOME/.vimrc

rm -f $HOME/bin/vysor
ln -s $PWD/vysor $HOME/bin/vysor

rm -f $HOME/.Xresources
ln -s $PWD/xresources $HOME/.Xresources

# [include] gitconfig into .gitconfig
printf "[include]\npath = $PWD/gitconfig\n" >> $HOME/.gitconfig
