call plug#begin('~/.vim/plugged')
"
" plugin section

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty' 
Plug 'junegunn/fzf'
Plug 'preservim/nerdtree'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mlaursen/vim-react-snippets'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

call plug#end()

"========= Autocomplete ========
let g:deoplete#enable_at_startup = 1


let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'], 
    \ }

" FORMATTERS
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ cssall  

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

set hidden
syntax on

set noswapfile
set nobackup
set nowb

" ================ Indentation ======================
set tabstop=2
set shiftwidth=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

"======== NERDTREE =============
"don't enable by default
let g:NERDTreeHijackNetrw=0

" =================== imaps ============
:imap jj <Esc>
:imap :e :Explore
nnoremap <leader>l :call LanguageClient_contextMenu()<CR>
nnoremap K :call LanguageClient#textDocument_hover()<CR>
nnoremap gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>r :call LanguageClient#textDocument_rename()<CR>
map <C-b> :NERDTreeToggle<CR>

"==========auto completion============="
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"==========snippets==============
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"================ Theme ============================
colorscheme dracula
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
