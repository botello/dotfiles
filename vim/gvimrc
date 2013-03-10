"--------------------------------------------------------------------------
" .gvimrc
" Author: botello <botello@gmail.com>
" Source: https://github.com/botello/vim
"--------------------------------------------------------------------------

"--------------------------------------------------------------
" GUI settings 
"--------------------------------------------------------------
    if has("gui_running")
        if has("gui_gtk2")
            set guifont=Droid\ Sans\ Mono\ Slashed\ for\ Powerline\ 13
            set printfont=Droid\ Sans\ Mono\ 10
        elseif has("gui_win32")
            "set guifont=Menlo_for_PowerLine:h10:cANSI
            set guifont=Droid_Sans_Mono_Slashed_for_Pow:h10:cANSI
            "set guifont=PragmataPro:h11:cANSI
            "set guifont=Consolas:h10:cANSI
            set printfont=Consolas:h10:cANSI
        endif

        set lines=50 columns=100
        set linespace=0   " vertical space between text lines.

        set guioptions-=b
        set guioptions-=m
        set guioptions-=T

        " Toggle Menu and Toolbar
        map <silent> <F11> :if &guioptions =~# 'T' <Bar>
            \set guioptions-=m <Bar>
            \set guioptions-=T <Bar>
        \else <Bar>
            \set guioptions+=m <Bar>
            \set guioptions+=T <Bar>
        \endif<CR>

        " Search for (visual) selected text using mapped '*' and '#'.
        vnoremap <silent> * :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy/<C-R><C-R>=substitute(
                \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gV:call setreg('"', old_reg, old_regtype)<CR>
        vnoremap <silent> # :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy?<C-R><C-R>=substitute(
                \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gV:call setreg('"', old_reg, old_regtype)<CR>

        " Highlight trailing spaces
        match Visual "\s\+$"

    endif

