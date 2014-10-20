"runtime bundle/vim-pathogen/autoload/pathogen.vim
"call pathogen#infect()

set nocompatible

" generic 
set history=50
set path=.,include,../include,/usr/include,/usr/local/include

" display 
set ruler               " show ruler
set laststatus=2        " always show status line
set scrolloff=2         " always keep two lines above/below cursor
set smarttab            " hitting tab in front of a line indents SHIFTWIDTH
set expandtab           " hitting tab otherwise puts in spaces

set backspace=indent,eol,start

" search 
set ic

" set bs=2              "allow backspacing over everything in insert mode

" code editing
set showmatch           "briefly show matching bracket
set wildmenu
set wildmode=longest:list

" allow paste in visual mode
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

nnoremap <F6> :if exists("syntax_on") <Bar> syntax off <Bar> else <Bar> syntax on <Bar> endif <CR>
nnoremap <F7> :make<CR><CR>

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 1 || has("gui_running")
  syntax on
endif

hi Identifier   ctermfg=cyan            guifg=darkmagenta cterm=none
hi String       ctermfg=blue            guifg=blue cterm=none
hi Comment      ctermfg=blue            guifg=darkcyan cterm=none
hi PreProc      ctermfg=darkred         guifg=darkred cterm=none
hi Constant     ctermfg=darkmagenta     guifg=darkmagenta cterm=none
hi Statement    ctermfg=brown           guifg=brown cterm=none
hi Type         ctermfg=darkgreen       guifg=darkgreen cterm=none

hi StatusLine   ctermfg=white           ctermbg=blue guifg=white             guibg=blue cterm=none
hi StatusLineNC ctermfg=white           ctermbg=black guifg=white             guibg=black cterm=none

set guifont=Monaco:h18

" Visual bell
set visualbell


" Only do this part when compiled with support for autocommands.
if has("autocmd")
    set sw=4
    "autocmd BufNewFile,BufRead *.txt set tw=78 fo=tan2 ai
    autocmd BufNewFile,BufRead *.cpp,*.[ch] set cino=g0 sw=8

    " auto wrap comments
    autocmd BufNewFile,BufRead *.py set formatoptions=cr sw=4
endif

filetype plugin indent on

"grep
" let Grep_Skip_Dirs = 'CVS .svn .svn-base .git'
" set grepprg=/opt/local/bin/grep\ -nH
set grepprg=grep\ -n\ -r\ --exclude-dir=.svn
" alias grep='grep --color         --exclude-dir='\''.svn'\''         --exclude-dir='\''pynl'\''         --exclude='\''*.swp'\''         --exclude='\''*.pyc'\'''

map <F4> :execute "vimgrep /" . expand("<cword>") . "/gj ./**/*.py" <Bar> cw<CR>

"##############################################################################                                                                         
""" Easier split navigation                                                                                                                               
"##############################################################################                                                                         
""
"" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>                                                                                        
nmap <silent> <c-j> :wincmd j<CR>                                                                                        
nmap <silent> <c-h> :wincmd h<CR>                                                                                        
nmap <silent> <c-l> :wincmd l<CR>

"##### hack for mavericks per - 
"#####   http://stackoverflow.com/questions/20645920/adding-clang-complete-to-homebrew-installed-vim-on-mac
let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
  let g:clang_library_path=s:clang_library_path
endif

colorscheme zellner
