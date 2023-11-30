
clone the repo into ~/.config
add private/ to this directory containing
  - bashrc_private - aliases and envs for bash

run:

`rm ~/.vimrc`
`rm -rf ~/.config/nvim`
`rm ~/.bashrc`
`rm ~/.tmux.conf`

//These assume you cloned this repo into ~/.config.
`ln -s ~/.config/gitDotfiles/vimrc ~/.vimrc`
`ln -sfn ~/.config/gitDotfiles/nvim ~/.config/nvim`
`ln -s ~/.config/gitDotfiles/bashrc ~/.bashrc`
`ln -s ~/.config/gitDotfiles/private/bashrc_private ~/.bashrc_private`
`ln -s ~/.config/gitDotfiles/tmux.conf ~/.tmux.conf`

