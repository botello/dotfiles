#dotfiles
All my dot files including vim, zsh, screen, tmux.

Installing is simple, just clone the repository from home directory.

    git clone --recursive https://github.com/botello/dotfiles dotfiles

## Vim
The first step is to create a symbolic link in home directory. This process
depends if we are in Windows or in Linux.

### For Linux
    cd ~
    ln -s dotfiles/shell/xinitrc.adelrior .xinitrc.adelrior
    ln -s dotfiles/shell/Xdefaults        .Xdefaults
    ln -s dotfiles/shell/Xresources       .Xresources
    ln -s dotfiles/shell/aliases          .aliases
    ln -s dotfiles/shell/bashrc.adelrior  .bashrc.adelrior
    ln -s dotfiles/shell/cshrc.adelrior   .cshrc.adelrior

    # Window manager - fvwm2
    ln -s dotfiles/fvwm2/dracula/fvwm2rc  .fvwm2rc

    # Font installation -- tamzen
    mkdir -p .fonts/tamzen-font/bfd
    cp dotfiles/tools/tamzen-font/bfd/*   .fonts/tamzen-font/bfd
    cd dotfiles/tools/tamzen-font/bfd
    mkfontdir
    mkfontscale
    cd ~
    xset +fp $HOME/.fonts/tamzen-font/bfd
    xset fp rehash

    # Optional
    ln -s dotfiles/vim/vimrc              .vimrc
    ln -s dotfiles/tmux/tmux.conf         .tmux.conf
    ln -s dotfiles/screen/screenrc        .screenrc


### For Windows
    cd %USERPROFILE%
    mklink dotfiles\vim\vim   .vim
    mklink dotfiles\vim\vimrc .vimrc

If for some reason you cannot create a symlink you can create a new file
in home that sources {{vimrc}} file. Like so:
    " File: %USERPROFILE%/.vimrc
    source $HOME/dotfiles/vim/vimrc

Next, clone {{Vundle.vim}} git repository from github. Vundle is used as
plug-in manager for Vim. Finally install all plug-ins as defined in
{{vimrc}} file.
    git submodule init "vim/bundle/Vundle.vim"
    vim +PluginInstall +qall
