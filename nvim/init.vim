
" Auto commands

augroup General

    autocmd FileType markdown,text setlocal spell

"    autocmd BufReadPost * Goyo 90%x90%
    autocmd VimResized * execute "normal \<C-W>="

augroup END

"=====================================================

"vim-plug

"specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
"   " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')
"
"   " Make sure you use single quotes

Plug 'fatih/molokai'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'jiangmiao/auto-pairs'

Plug 'Yggdroot/indentLine'

call plug#end()
"=====================================================
"Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"=====================================================
"cmds
command Cfg edit ~/.config/nvim/init.vim

"=====================================================
"deoplete
let g:deoplete#enable_at_startup = 1

"=====================================================
" Indenting

set autoindent
set smartindent

set shiftwidth=4

let g:indentLine_char = '⎸'
let g:indentLine_color_term = 239
"=====================================================

" Natural split

set splitbelow
set splitright

"=====================================================

" Nerdtree

"noremap <TAB> :NERDTreeToggle<CR>
"noremap <F5> :NERDTreeFocus<CR>

"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"=====================================================

" No backup file

set nobackup

"=====================================================

" On pressing tab, insert 4 spaces

set expandtab


"=====================================================

" Plugins

" Plugin directory

" End list



"=====================================================

" Searching

set hlsearch
set incsearch
set ignorecase
set smartcase

nnoremap <esc> :noh<CR>

"=====================================================

" Set title of file as window title

set title

"=====================================================


" Show existing tab with 4 spaces width

set tabstop=4

"=====================================================

" Show invisible characters

set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_

"=====================================================

" Spelling

set spelllang=en_au

hi SpellBad ctermbg=1 ctermfg=0

"=====================================================

" UI

set cmdheight=2
set laststatus=0
set noshowmode
set number relativenumber
set scrolloff=5
set shortmess=atI
set ttyfast

"if (empty($TMUX))
"  if (has("nvim"))
"    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"  if (has("termguicolors"))
"    set termguicolors
"  endif
"endif

"let g:onedark_termcolors=256
syntax on
"colorscheme raabcolors
"colorscheme challenger_deep
colorscheme molokai
"=====================================================

" Wrapping

set breakindent
set linebreak

nnoremap <down> gj
nnoremap <up> gk
vnoremap <down> gj
vnoremap <up> gk

"=====================================================

" netrw
"
let g:netrw_banner = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" Add your own mapping. For example:
noremap <silent> <TAB> :call ToggleNetrw()<CR>

"augroup ProjectDrawer
"  autocmd!
"
"  autocmd VimEnter * :Vexplore
"
"augroup END
