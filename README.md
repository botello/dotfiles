#dotfiles
All my dot files including vim, zsh, screen, tmux.

Installing is simple, just clone the repository from home directory.

    git clone https://github.com/botello/dotfiles .dotfiles

## Vim
The first step is to create a symbolic link in home directory. This process
depends if we are in Windows or in Linux.

For Linux
    cd ~
    ln -s .dotfiles/vim/vimrc .vimrc

For Windows
    cd %USERPROFILE%
    mklink .dotfiles\vim\vimrc .vimrc

Next, clone {{Vundle.vim}} git repository from github. Vundle is used as
plug-in manager for Vim. Finally install all plug-ins as defined in
{{vimrc}} file.
    git submodule init "vim/bundle/Vundle.vim"
    vim +PluginInstall +qall
