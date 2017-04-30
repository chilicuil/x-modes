[x-modes.vim](https://github.com/chilicuil/x-modes.vim) is a global plugin who set preferences according to they way I use [vim](http://vim.org). It sets highly opinionated settings. Probably not something you would like to use.

Preview
-------

<p align="center">
  <img src="http://javier.io/assets/img/x-modes-default.jpg"/><br>
  <img src="http://javier.io/assets/img/x-modes-dev.jpg"/><br>
  <img src="http://javier.io/assets/img/x-modes-word.jpg"/><br>
  <img src="http://javier.io/assets/img/x-modes-presentation.jpg"/><br>
</p>

Requirements
------------

* Vim 7.0+
* TagBar
* Nerdtree

Installation
------------

- [Vundle](https://github.com/gmarik/vundle) way (recommended), add the following to your $HOME/.vimrc file:

        Bundle 'chilicuil/x-modes.vim'

    And run inside of vim:

        :BundleInstall

- [Pathogen](https://github.com/tpope/vim-pathogen) way:

        $ git clone https://github.com/chilicuil/x-modes.vim.git ~/.vim/bundle/x-modes.vim

- **Manual** (simplest if you've never heard of vundle or pathogen), download the zip file generated from github and extract it to $HOME/.vim

        mv x-modes.vim*.zip $HOME/.vim
        cd $HOME/.vim && unzip x-modes.vim*.zip

    Update the help tags from vim:

        :helpt ~/.vim/doc/

Usage
-----

[x-modes.vim](https://github.com/chilicuil/x-modes.vim) define the following modes:

 - default (&lt;Leader&gt;D)
 - development (&lt;Leader&gt;d)
 - write (&lt;Leader&gt;w)
 - presentation (&lt;Leader&gt;p)

* Default

> On this mode, all other modes are disabled, raw vim mode

* Development

> On this mode, numbers are added to the main window, and Nerdtree && Taglist windows are opened to the right and left sides.

* Write

> On this mode, spelling is enabled (english-f2, spanish-f3), textwidth=72 and numbers disabled.

* Presentation

> On this mode, a whiteboard layout is set and shortcuts for going to the next slide (file, &lt;Space&gt;) and previous (&lt;Backspace&gt;) are defined.


Mappings can be redefined by setting:

    let g:x_modes_map_default      = '<Leader>D'
    let g:x_modes_map_development  = '<Leader>d'
    let g:x_modes_map_write        = '<Leader>w'
    let g:x_modes_map_presentation = '<Leader>p'
