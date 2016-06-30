" ============================================================================
" File:        x-modes.vim
" Description: vim global plugin for setting modes in vim
" Maintainer:  Javier Lopez <m@javier.io>
" ============================================================================

" Init {{{1
if exists('g:loaded_x_modes') || &cp
  finish
endif
let g:loaded_x_modes = 1

if v:version < '700'
  echoerr "x-modes unavailable: requires Vim 7.0+"
  finish
endif

" Default configuration {{{1
if !exists('g:x_modes_map_default')
  let g:x_modes_map_default = '<Leader>D'
endif

if !exists('g:x_modes_map_development')
  let g:x_modes_map_development = '<Leader>d'
endif

if !exists('g:x_modes_map_write')
  let g:x_modes_map_write = '<Leader>w'
endif

if !exists('g:x_modes_map_presentation')
  let g:x_modes_map_presentation = '<Leader>p'
endif

" Commands & Mappings {{{1
command! XDefaultMode      call xmodes#Default_mode()
command! XDevelopmentMode  call xmodes#Development_mode()
command! XWriteMode        call xmodes#Write_mode()
command! XPresentationMode call xmodes#Presentation_mode()

if !hasmapto('<Plug>XDefaultMode')
    exe "map <unique> " . g:x_modes_map_default . " <Plug>XDefaultMode"
endif

if !hasmapto('<Plug>XDevelopmentMode')
    exe "map <unique> " . g:x_modes_map_development . " <Plug>XDevelopmentMode"
endif

if !hasmapto('<Plug>XWriteMode')
    exe "map <unique> " . g:x_modes_map_write . " <Plug>XWriteMode"
endif

if !hasmapto('<Plug>XPresentationMode')
    exe "map <unique> " . g:x_modes_map_presentation . " <Plug>XPresentationMode"
endif

nnoremap <unique> <script> <Plug>XDefaultMode      :XDefaultMode<CR>
nnoremap <unique> <script> <Plug>XDevelopmentMode  :XDevelopmentMode<CR>
nnoremap <unique> <script> <Plug>XWriteMode        :XWriteMode<CR>
nnoremap <unique> <script> <Plug>XPresentationMode :XPresentationMode<CR>
