" ============================================================================
" File:        x-modes.vim
" Description: vim global plugin for setting modes in vim
" Maintainer:  Javier Lopez <m@javier.io>
" License:     WTFPL -- look it up.
" ============================================================================

" Init {{{1
if exists('g:loaded_x_modes') || &cp
  finish
endif
let g:loaded_x_modes = 1

if v:version < '700'
  echoerr "X-modes unavailable: requires Vim 7.0+"
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

exe "nnoremap <silent>" g:x_modes_map_default      ":XDefaultMode<CR>"
exe "nnoremap <silent>" g:x_modes_map_development  ":XDevelopmentMode<CR>"
exe "nnoremap <silent>" g:x_modes_map_write        ":XWriteMode<CR>"
exe "nnoremap <silent>" g:x_modes_map_presentation ":XPresentationMode<CR>"
