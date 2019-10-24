#! /usr/bin/env sh

rm -f $HOME/.profile
ln -s ./dot_profile $HOME/.profile

rm -f $HOME/.config/i3/config
ln -s ./i3config $HOME/.config/i3/config

rm -f $HOME/.vimrc
ln -s ./vimrc $HOME/.vimrc

rm -f $HOME/bin/vysor
ln -s ./vysor $HOME/bin/vysor

