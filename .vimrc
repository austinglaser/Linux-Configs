" Vundle (plugin manager) stuff
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins
Plugin 'vim-scripts/Conque-GDB'
Plugin 'git@github.com:vim-scripts/localrc.vim.git'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'aperezdc/vim-template'
Plugin 'godlygeek/tabular'
Plugin 'git@github.com:plasticboy/vim-markdown.git'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}


" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set number "Show line numbers all the time

set cindent "Auto indent for me when I open .c files.
set smartindent
set autoindent

set expandtab "Insert spaces, not a tabstop when I hit the tab key

" insert a literal tab character with Shift+Tab
inoremap <S-Tab> <C-V><Tab>

" list trailing whitespace
set listchars=tab:>-,trail:.,extends:>,precedes:<
set list

"Align case: inside switch()
" :help cinoptions-values
set cinoptions=:0

hi NonText ctermfg=8 guifg=gray
hi SpecialKey ctermfg=8 guifg=gray

"turn off expand tab for makefiles
"This is because makefiles are 'whitespace'
"sensitive and expect a tabstop, not a certain
"number of spaces
autocmd FileType make setlocal noexpandtab

"treat .ino and .pde files as .cpp (for arduino and zapuino)
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

" Auto line wrapping
autocmd BufRead,BufNewFile *.txt setlocal wm=2 tw=80
autocmd BufRead,BufNewFile *.tex setlocal wm=2 tw=80
autocmd BufRead,BufNewFile *.md setlocal wm=2 tw=80
autocmd BufRead,BufNewFile *.markdown setlocal wm=2 tw=80

" Spell Check
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.markdown setlocal spell spelllang=en_us

"Set all tabs to be 2 wide
set tabstop=4
set softtabstop=4
set shiftwidth=4

"show whitespace

syntax on "Turn on syntax highlighting

"Colorscheme
colorscheme koehler

"save temp files in tmp!
set backupdir=/tmp/
set directory=/tmp/

"ConqueGdb options
let g:ConqueGdb_SrcSplit = 'left'
"let g:ConqueGdb_Leader = ';'

"vim-template options
let g:username = 'Austin Glaser'
let g:email = 'austin@boulderes.com'
let g:templates_no_builtin_templates = 1
let g:templates_directory = '~/.vim/templates'

"Wrap comments, and keep a comment open within insert mode
" :help fo-table
autocmd BufRead,BufNewFile * setlocal fo+=tcr
autocmd BufRead,BufNewFile * setlocal fo-=o

command WrapToggle call WrapToggle()
function! WrapToggle()
  if &formatoptions =~ 't'
    set fo-=t
    echom "auto wrap off"
  else
    set fo+=t
    echom "auto wrap on"
  endif
endfunction

"auto load changed files, read every 5 seconds
source ~/.vim/WatchForChanges.vim
silent WatchForChanges
