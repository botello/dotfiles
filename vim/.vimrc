"--------------------------------------------------------------------------
" .vimrc
" Author: botello <botello@gmail.com>
" Source: https://github.com/botello/vim
"--------------------------------------------------------------------------

"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------
    source $VIMRUNTIME/mswin.vim
    set nocompatible
    behave mswin
    filetype off

"--------------------------------------------------------------------------
" Vundle
"--------------------------------------------------------------------------
    set rtp+=$HOME/.vim/
    set rtp+=$HOME/.vim/bundle/vundle/
    call vundle#rc()

"--------------------------------------------------------------------------
" Bundles
"--------------------------------------------------------------------------
    Bundle 'gmarik/vundle'
    Bundle 'Lokaltog/vim-powerline'
    Bundle 'tristen/superman'
    Bundle 'kien/ctrlp.vim'
    Bundle 'thinca/vim-fontzoom'
    Bundle 'verilog_systemverilog.vim'
    Bundle 'altercation/vim-colors-solarized'

"--------------------------------------------------------------------------
" Settings
"--------------------------------------------------------------------------
    filetype plugin indent on
    set encoding=utf-8 fileformats=unix,dos,mac
    set laststatus=2 cmdheight=2
    set backspace=2
    set autochdir history=1000
    set shortmess=atI report=0 showcmd hidden
    set completeopt=longest,menu " for omnipotent

    syntax enable
    set background=dark
    colorscheme solarized
    "colorscheme superman

    set number textwidth=78 colorcolumn=+1
    set nowrap linebreak
    set hlsearch incsearch ignorecase smartcase
    set nolazyredraw
    set scrolloff=4
    set wildignore=.svn,CVS,.git,.hg,*.o,*.so,*.obj,*.swp,*.jpg,*.png,*.gif
    set wildmenu
    set wildmode=list:longest,full

    " Spaces instead of tabs
    let tabsize = 4
    execute "set tabstop=".tabsize
    execute "set shiftwidth=".tabsize
    execute "set softtabstop=".tabsize
    set expandtab

    " Enable spelling
    set spell spelllang=en_us

    " Trailing whitespace
    set nolist
    set listchars=tab:»·,trail:·,extends:»,precedes:«,eol:¶
    " Only shown when not in insert mode so I don't go insane.
    augroup trailing
        au!
        au InsertEnter * :set list
        au InsertLeave * :set nolist
    augroup END

    " Only show cursorline in the current window and in normal mode.
    augroup cline
        au!
        au WinLeave * set nocursorline
        au WinEnter * set cursorline
        au InsertEnter * set nocursorline
        au InsertLeave * set cursorline
    augroup END

    " Maping next/prev buffer to <TAB> and <SHIFT-TAB> key in cmd mode
    nnoremap <silent> <tab> :bnext<cr>
    nnoremap <silent> <s-tab> :bnext<cr>

    " Disable backup file, enable read modified files
    set nobackup nowarn noswapfile
    set autoread

    " Disable all sounds and visual bells
    set noerrorbells visualbell t_vb=
    autocmd GUIEnter * set visualbell t_vb=

    " Reselect visual block after indent/outdent
    vnoremap < <gv
    vnoremap > >gv

    set diffexpr=MyDiff()
    function MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_ne:e
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let eq = ''
        if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
                let cmd = '""' . $VIMRUNTIME . '\diff"'
                let eq = '"'
            else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
        else
            let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction

"--------------------------------------------------------------------------
" Plugin configuration
"--------------------------------------------------------------------------
    " lokaltog/vim-powerline
    let g:Powerline_symbols='fancy'
    "let g:Powerline_symbols='compatible'

    " thinca/vim-fontzoom
    silent! nmap <unique> <silent> <C-kPlus> <Plug>(fontzoom-larger)
    silent! nmap <unique> <silent> <C-kMinus> <Plug>(fontzoom-smaller)

    " altercation/vim-colors-solarized
    call togglebg#map("<F5>")


