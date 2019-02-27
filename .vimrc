" Vim configuration file (.vimrc)
" Author: Rene Berger <hello.gridkid@gmail.com>


" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it change other options as a side effect.
set nocompatible


" vim-plug configuration {

  " Automate the 'vim-plug' installation process
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  " Specify a directory for plugins
  " - Avoid using standard Vim directory names like 'plugin'
  call plug#begin('~/.vim/plugged')

  " On-demand loading
  Plug 'chriskempson/base16-vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'itchyny/lightline.vim'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'

  " Initialize plugin system
  call plug#end()

" }

" Plugin configuration {

  let g:lightline = {
        \ 'colorscheme': 'solarized',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
        \   'right': [ [ 'lineinfo' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
        \ },
        \ 'component_function': {
        \   'mode': 'LightlineMode',
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'fileencoding': 'LightlineFileencoding',
        \   'filetype': 'LightlineFiletype',
        \   'fugitive': 'LightlineFugitive',
        \ },
        \ 'separator': { 'left': '⮀', 'right': '⮂' },
        \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
        \ }

  function! LightlineMode()
    let fname = expand('%:t')
    return &ft == 'unite' ? 'Unite' : winwidth(0) > 60 ? lightline#mode() : ''
  endfunction

  function! LightlineModified()
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
  endfunction

  function! LightlineReadonly()
    return &ft !~? 'help' && &readonly ? '⭤' : ''
  endfunction

  " Concatenating readonly, filename and the modified mark
  function! LightlineFilename()
    return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
          \ (&ft == 'unite' ? unite#get_status_string() :
          \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
          \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
  endfunction

  function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
  endfunction

  function! LightlineFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
  endfunction

  function! LightlineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
  endfunction

  function! LightlineFugitive()
    if exists("*fugitive#head")
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
    endif
  return ''
  endfunction

" }


" General Settings {

  set autoread                      " Reload files changed outside of Vim
  set backspace=indent,eol,start    " Allow backspacing over everything in insert mode
  set encoding=utf-8                " Character encoding
  set mouse=a                       " Allow mouse scrolling in xTerm
  set nobackup                      " Do not keep a backup file, use versions instead
  set noswapfile                    " Do not keep a swp file

" }

" Vim UI {

  let base16colorspace=256          " Access colors present in 256 colorspace

  syntax on                         " Switch syntax highlighting on, when the terminal has colors
  colorscheme base16-tomorrow-night " Load a colorscheme (eg. solarized)

  set background=dark               " Assume a dark background
  set cursorline                    " Highlight current line
  set laststatus=2                  " Show status line
  set number                        " Show line number(s)
  set relativenumber                " Show relative line nubers (see how far your commands will go)
  set ruler                         " Show current line and column position in file
  set scrolloff=5                   " Number of screen lines to keep above and below the cursor
  set showcmd                       " Show incomplete cmds down the bottom
  set showmatch                     " Highlight matching brackets [{()}]
""  set showmode                      " Show current mode down the bottom
  set noshowmode                    " ... don't show current mode (statusline)
  set sidescroll=5                  " Number of screen columns to keep to the left and right of the cursor
  set splitbelow                    " Open new split panes below the current
  set splitright                    " Open new split panes to the right of the current
  set t_Co=256                      " Enable 256 colors

  " Search {

    set hlsearch                    " Highlight search results
""    set nohlsearch                  " Don’t keep results highlighted after search
    set incsearch                   " Find as you type
    set ignorecase                  " Case insensitive search
    set smartcase                   " ... don't ignore Capitals when present

  " }

" }

" Formatting (can overwride by editorconfig) {

  set nowrap                        " Don't wrap long lines

  set autoindent                    " Indent at the same level of the previous line
  set expandtab                     " Tabs are spaces, not tabs
  set shiftwidth=2                  " Use indents of 2 spaces (used for auto indenting)
  set smarttab                      " An <Tab> in front of a line inserts blanks according to shiftwidth
  set softtabstop=2                 " Let <BS> delete indent
  set tabstop=2                     " An indentation every four columns

" }

" Key (re)Mappings {

  " Switching buffers
  nnoremap <up> :bfirst<cr>         " Go to first file
  nnoremap <down> :blast<cr>        " Go to last file
  nnoremap <left> :bp<cr>           " Jump to previous file
  nnoremap <right> :bn<cr>          " Jump to next file

  " Switching windows
  nnoremap <tab> <C-w><C-w>         " Jump to next window
  nnoremap <S-tab> <C-w>W           " Jump to previous window

  let mapleader = ','               " Change mapleader key

  nnoremap <leader>ev :vsplit $MYVIMRC<CR> " edit the .vimrc
  nnoremap <leader>sv :source $MYVIMRC<CR> " source the .vimrc

  nnoremap <leader><space> :nohlsearch<CR> " Turn off highlight search results

  " Plugin fugitive.vim {

    nnoremap <silent> <leader>gs :Gstatus<CR><C-w>20+
    nnoremap <silent> <leader>gd :Gdiff<CR><C-w>20+
    nnoremap <silent> <leader>gc :Gcommit<CR><C-w>20+
    nnoremap <silent> <leader>gw :Gwrite<CR><C-w>20+

  " }

" }
