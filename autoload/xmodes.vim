" ============================================================================
" File:        x-modes.vim
" Description: vim global plugin for setting modes in vim
" Maintainer:  Javier Lopez <m@javier.io>
" License:     WTFPL -- look it up.
" ============================================================================

function! xmodes#FileManagerToggle() "need it to force to close it
    if exists ("s:file_manager")
        "NERDTreeTabsClose
        NERDTreeClose
        wincmd p      "forces to return the focus to the window who call it
        unlet s:file_manager
    else
        "NERDTreeTabsToggle
        NERDTreeToggle
        wincmd p      "forces to return the focus to the window who call it
        let s:file_manager = 1
    endif
endfunction

function! xmodes#FunctionBrowserToggle()
    if exists ("s:function_browser")
        TagbarClose
        unlet s:function_browser
    else
        TagbarToggle
        let s:function_browser = 1
    endif
endfunction

function! xmodes#Spell(_language)
    if (a:_language == "en_us")
        set spell spelllang=en_us
    elseif (a:_language == "es_mx")
        set spell spelllang=es_mx
    elseif (a:_language == "none")
        set nospell
    endif
endfunction
                                                                                                 
function! xmodes#Write_mode()
    if exists ("s:Write_mode")
        call xmodes#Write_mode_off()
        unlet s:Write_mode
    else
        call xmodes#Write_mode_on()
        let s:Write_mode = 1
    endif
endfunction

function! xmodes#Write_mode_on()
    set linebreak
    set nonumber
    set textwidth=70
    call xmodes#Spell("en_us")

    noremap  <F3>      :call xmodes#Spell("es_mx")<CR>
    noremap  <F4>      :call xmodes#Spell("en_us")<CR>
    inoremap <F3> <Esc>:call xmodes#Spell("es_mx")<CR>a
    inoremap <F4> <Esc>:call xmodes#Spell("en_us")<CR>a

    redraw!
endfunction

function! xmodes#Write_mode_off()
    set nolinebreak
    unmap <F4>
    unmap <F3>
    iunmap <F4>
    iunmap <F3>
    call xmodes#Spell("none")
    redraw!
endfu

function! xmodes#Development_mode()
    if exists ("s:Development_mode")
        call xmodes#Development_mode_off()
        unlet s:Development_mode
    else
        call xmodes#Development_mode_on()
        let s:Development_mode = 1
    endif
endfunction

function! xmodes#Development_mode_on()
    set number         "show the number of the lines on the left of the screen
    set linebreak      "wrap at word

    if !exists("s:file_manager")
        call xmodes#FileManagerToggle()
    endif

    if !exists("s:function_browser")
        call xmodes#FunctionBrowserToggle()
    endif

    redraw!
endfunction

function! xmodes#Development_mode_off()
    if exists ("s:file_manager")
        call xmodes#FileManagerToggle()
    endif

    if exists ("s:function_browser")
        call xmodes#FunctionBrowserToggle()
    endif

    "set nocursorline
    set nonumber
    set nolinebreak

    redraw!
endfunction

function! xmodes#Presentation_mode()
    if exists ("s:Presentation_mode")
        call xmodes#Presentation_mode_off()
        unlet s:Presentation_mode
    else
        call xmodes#Presentation_mode_on()
        let s:Presentation_mode = 1
    endif
endfunction

function! xmodes#Presentation_mode_on()
    "this .vimrc config was created firstly by Vroom-0.23
    set nocursorline         "highlight the screen line of the cursor

    map <SPACE> :n<CR>:<CR>
    map <BACKSPACE> :N<CR>:<CR>
    map OO :!open <cWORD><CR><CR>
    map EE :e <cWORD><CR>
    map !! G:!open <cWORD><CR><CR>
    map ?? :e .help<CR>
    let g:old_statusline=&statusline

    set statusline=
    set statusline+=%2*%-.50f\                               "file name (!full)
    set statusline+=%*\ \ \ Press\ \<Space\>\ or\ \<Backspace\>\ to\ continue
    set statusline+=%h%1*%m%r%w%0*                           "flags
    set statusline+=%=                                       "right align
    set statusline+=%2*%-8{strftime('%H:%M')}                "time

    redraw!
endf

function! xmodes#Presentation_mode_off()
    set cursorline         "highlight the screen line of the cursor
    unmap <SPACE>
    noremap <SPACE> i <Esc>
    unmap <BACKSPACE>
    unmap OO
    unmap EE
    unmap !!
    unmap ??
    let &statusline=g:old_statusline
    redraw!
endf

function! xmodes#Default_mode()
    if exists ("s:Write_mode")
        call xmodes#Write_mode()
    endif
    if exists ("s:Development_mode")
        call xmodes#Development_mode()
    endif
    if exists ("s:Presentation_mode")
        call xmodes#Presentation_mode()
    endif

    if exists ("s:file_manager")
        call xmodes#FileManagerToggle()
    endif

    if exists ("s:function_browser")
        call xmodes#FunctionBrowserToggle()
    endif
endfunction
