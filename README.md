clone the repo into ~/.config

add private/ to this directory containing
  - bashrc_private - any extra env variables

run:

`rm ~/.vimrc`
`rm ~/.bashrc`

//These assume you cloned this repo into ~/.config.

`ln -s ~/.config/gitDotfiles/vim/vimrc ~/.vimrc`
`ln -s ~/.config/gitDotfiles/vim/after ~/.vim/after`
`ln -s ~/.config/gitDotfiles/vim/coc-settings.json ~/.vim/coc-settings.json`

`ln -s ~/.config/gitDotfiles/bashrc ~/.bashrc`

//if you made bashrc_private
`ln -s ~/.config/gitDotfiles/private/bashrc_private ~/.bashrc_private`


