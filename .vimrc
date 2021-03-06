" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup    " do not keep a backup file, use versions instead
else
  set backup    " keep a backup file
endif
set history=50    " keep 50 lines of command line history
set ruler   " show the cursor position all the time
set showcmd   " display incomplete commands
set incsearch   " do incremental searching
set number    " show line number
set tabstop=4
set shiftwidth=4
set expandtab
set textwidth=80
set background=dark

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  autocmd BufRead *.rhtml set filetype=eruby

  augroup END

else

  set autoindent    " always set autoindenting on

endif " has("autocmd")

set backspace=2   " backspace can join lines
set shiftwidth=4      " <Tab> at start of line tabs 2 chars
set expandtab
set tabstop=4
set autoindent
"set smarttab         " <Tab> at start of line tabs <shiftwidth> chars
set ruler                     " show cursor position
set incsearch
set nottybuiltin
"set   errorformat=%f:%l:%m,\"%f\"\\,\ line\ %l\:\ %m " This eats gcc and SGI cc/CC
set   magic             " regular expressions the way I'm used to them
set   cinoptions=>s,{0,}0,?0,^0,:0,=s,p0,t0,+s,(0,)20,*30
"Use the viminfo file to remember edit histories (very useful for me)
set viminfo=%,'30,:200,/50,\"500,n~/.viminfo
set   showcmd
set   showmatch
" Oh I hate it when programs do things I didn't ask for
set   nostartofline
"Context lines = 3
set   so=3
set   noautowrite
"set   noerrorbells
set   hidden
set   noignorecase " == case-sensitive
"set   nonumber
set   number
set   visualbell
set   ch=2      " Make command line two lines high

set background=dark
colorscheme elflord
set guifont="Monospace 13"
