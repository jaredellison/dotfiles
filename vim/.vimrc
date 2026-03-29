" vim-plug setup
" see https://github.com/junegunn/vim-plug
call plug#begin()

Plug 'mhartington/oceanic-next'
Plug 'preservim/nerdtree'
Plug 'joom/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" TODO: Resolve conflict with window resizing commands
" Plug 'mg979/vim-visualvmulti', {'branch': 'master'} 
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'psliwka/vim-smoothie'

" Git
Plug 'airblade/vim-gitgutter' 
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'ruanyl/vim-gh-line'
Plug 'xuyuanp/nerdtree-git-plugin'

call plug#end()

" Basic Settings
set number                  " Show line numbers
set relativenumber          " Relative line numbers for easier navigation
set tabstop=2               " 2 spaces for tabs (common in web dev)
set shiftwidth=2            " Indent width
set expandtab               " Use spaces instead of tabs
set autoindent              " Auto-indent new lines
set smartindent             " Smart indentation
set wrap                    " Wrap long lines
set linebreak               " Break lines at word boundaries
set showmatch               " Highlight matching brackets
set hlsearch                " Highlight search results
set incsearch               " Incremental search
set ignorecase              " Case-insensitive search
set smartcase               " Case-sensitive if uppercase used
set clipboard=unnamed       " Use system clipboard
set mouse=a                 " Enable mouse support
set cursorline              " Highlight current line
set wildmenu                " Enhanced command completion
set laststatus=2            " Always show status line
set backspace=indent,eol,start " Better backspace behavior

" File handling
set encoding=utf-8
set fileencoding=utf-8
set autoread                " Auto-reload changed files
set noswapfile              " Disable swap files
set nobackup                " Disable backup files
set undofile                " Enable persistent undo
set undodir=~/.vim/undodir  " Undo directory 

" Visual enhancements
if has("termguicolors")
  set termguicolors
endif
syntax enable              " Enable syntax highlighting
set background=dark        " Dark background
colorscheme oceanicnext
set showmode               " Show current mode
set ruler                  " Show cursor position
hi Normal guibg=#1e2225 ctermbg=235

" Split behavior
set splitbelow             " Horizontal splits below
set splitright             " Vertical splits to the right

" Folding
set foldmethod=indent      " Fold based on indentation
set foldlevelstart=20      " Start with folds open

" Performance
set lazyredraw             " Don't redraw during macros
set ttyfast                " Fast terminal connection
set re=0

" Key mappings for web development
let mapleader = " "        " Space as leader key

" Quick save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" Clear search highlighting
nnoremap <leader>h :nohlsearch<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize windows
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" Resize windows within a terminal
tnoremap <C-Up> <C-\><C-n>:resize +2<CR>a
tnoremap <C-Down> <C-\><C-n>:resize -2<CR>a
tnoremap <C-Left> <C-\><C-n>:vertical resize -2<CR>a
tnoremap <C-Right> <C-\><C-n>:vertical resize +2<CR>a

"Buffer navigation
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>
nnoremap <leader>d :bdelete<CR>

" Tab navigation
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>] :tabnext<CR>
nnoremap <leader>[ :tabprevious<CR>

" Toggle file explorer
nnoremap <leader>e :Explore<CR>

" Quick edit vimrc
nnoremap <leader>ev :vsplit ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>

" Web development specific mappings
" HTML tag completion
inoremap <leader>< <><Left>
" Auto-close brackets and quotes
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>
"inoremap " ""<Left>
"inoremap ' ''<Left>

" File type specific settings
autocmd FileType html,css,scss,javascript,typescript,json,yaml,markdown setlocal tabstop=2 shiftwidth=2
autocmd FileType python setlocal tabstop=4 shiftwidth=4
autocmd FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab

" Status line customization
set statusline=%f         " File path
set statusline+=%m        " Modified flag
set statusline+=%r        " Read-only flag
set statusline+=%=        " Right-align the rest
set statusline+=%y        " File type
set statusline+=\ %l,%c   " Line and column
set statusline+=\ %P      " Percentage through file
" test

" Lightline Config
let g:lightline = {
  \ 'colorscheme': 'oceanicnext',
  \ 'separator':    { 'left': "\ue0b4", 'right': "\ue0b6" },
  \ }

" Netrw (built-in file explorer) settings
let g:netrw_banner=0       " Disable banner
let g:netrw_liststyle=3    " Tree view
let g:netrw_browse_split=4 " Open in previous window
let g:netrw_winsize=25     " 25% width

" fzf.vim shortcuts
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>b :Buffers<CR>

" NERDTree file explorer
nnoremap <leader>m :NERDTreeFocus<CR>
let NERDTreeShowHidden=1 " Show hidden files by default

" Git (fugitive)
nnoremap <leader>gs :G<CR>               " git status
nnoremap <leader>gc :G commit -m ""<Left>
nnoremap <leader>gh :GV<CR>              " git log (gv.vim)

" Move lines up/down with option
" nnoremap <A-k> :m .-2<CR>==
" nnoremap <A-j> :m .+1<CR>==

" Move selected lines
xnoremap <A-k> :m-2<CR>gv=gv
xnoremap <A-j> :m'>+<CR>gv=gv
nnoremap <A-k>  :<C-u>m-2<CR>==
nnoremap <A-j>  :<C-u>m+<CR>==

" CoC suggestions
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"nmap <silent> gD <Cmd>CocCommand tsserver.goToSourceDefinition<CR>
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Toggle bottom terminal
let g:term_buf = 0
let g:term_win = 0

function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Map to Leader + J
nnoremap <leader>j :call TermToggle(12)<CR>
inoremap <leader>j <Esc>:call TermToggle(12)<CR>
tnoremap <leader>j <C-\><C-n>:call TermToggle(12)<CR>

" Startify Config
let g:startify_custom_header = ''
let g:startify_change_to_vcs_root = 1

" Support JSX Comments
function! JsxCommentString()
  let l:syn = synIDattr(synID(line('.'), col('.'), 1), 'name')
  if l:syn =~? 'jsx\|tsx'
    setlocal commentstring={/*\ %s\ */}
  else
    setlocal commentstring=//\ %s
  endif
endfunction

autocmd CursorMoved,CursorMovedI *.jsx,*.tsx,*.js,*.ts call JsxCommentString()
