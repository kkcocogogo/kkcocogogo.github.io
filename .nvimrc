" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

" vim-plug auto install {
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    echo "Installing vim-plug for current user"
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
" }

" vim-plug plugins {
call plug#begin('~/.vim/plugged')

" code navigation and project navigation {

" read man pages in vim
Plug 'jez/vim-superman'

" file tree, for preview rather than navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'  }

" file navigation within project
Plug 'ctrlpvim/ctrlp.vim'
" yankring inside ctrlp, as an extension
Plug 'sgur/ctrlp-extensions.vim'
" Very simple function navigator for ctrlp.vim.
Plug 'tacahiroy/ctrlp-funky'
" search history in ctrlp
Plug 'ompugao/ctrlp-history'

" split pane navigation
Plug 't9md/vim-choosewin'
" resize split pane properly
Plug 'roman/golden-ratio'
Plug 'szw/vim-maximizer'

" close quickfix window when quit parent window
Plug 'romainl/vim-qf'

" go to anywhere on screen within 3 keystrokes
Plug 'Lokaltog/vim-easymotion'

" similar to sublime's multi cursors, though not quite there
Plug 'terryma/vim-multiple-cursors'

" }

" general vim behavior {

" git integration, :Gvdiff command is extremely useful
Plug 'tpope/vim-fugitive'
" Enables :Gbrowse from fugitive.vim to open GitHub URLs.
Plug 'tpope/vim-rhubarb'
" unix helpers like SudoEdit, Delete
Plug 'tpope/vim-eunuch'

" }

" code edting helper plugin {

" align code
Plug 'godlygeek/tabular'

" sql format
Plug 'mbra/prettysql'

" strip whitespace
Plug 'ntpeters/vim-better-whitespace'

" edit code snippet in a separate buffer
Plug 'chrisbra/NrrwRgn'

" deoplete and its friends
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }
" Plug 'nixprime/cpsm', { 'do': 'PY3=ON ./install.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/context_filetype.vim'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'davidhalter/jedi-vim'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'fisadev/vim-isort'
Plug 'raimon49/requirements.txt.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" enhanced dot repeat
Plug 'tpope/vim-repeat'

" Simplified clipboard functionality for Vim.
Plug 'svermeulen/vim-easyclip'

" bunch of handy key-mappings
Plug 'tpope/vim-unimpaired'

" code snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" surround stuff with other stuff
Plug 'tpope/vim-surround'

" auto insert close brackets
Plug 'jiangmiao/auto-pairs'

" nerdcommenter has a great name, but it just don't get python comments,
" besides, tcomment_vim is more actively developed
Plug 'tomtom/tcomment_vim'

" table mode, useful when drawing tables
Plug 'dhruvasagar/vim-table-mode'

" async syntax checker
Plug 'w0rp/ale'

" }

" search enhancement {

" ag in vim
Plug 'mileszs/ack.vim'

" star key to search in visual mode, z* for hold
Plug 'haya14busa/vim-asterisk'

" highlight search when using '/'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'

" }

" special file type handler {

" html / csv
Plug 'valloric/matchtagalways'
Plug 'mattn/emmet-vim'
Plug 'chrisbra/csv.vim'

Plug 'fatih/vim-go'

" better python folding
Plug 'tmhedberg/SimpylFold'

" filetypes not handled above will be handled by polyglot
Plug 'sheerun/vim-polyglot'

" }

" vim UI {

" fancy simbols on the command line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'altercation/vim-colors-solarized'
" }

call plug#end()
" }

" general vim settings {

let g:python3_host_prog='python3'

" escape key take immediate effect
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        autocmd InsertEnter * set timeoutlen=0
        autocmd InsertLeave * set timeoutlen=1000
    augroup END
endif

let mapleader=","
nnoremap ; :
vnoremap ; :
nmap j gj
nmap k gk
" de-highlight when redraw
nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
" Don't lose selection when shifting sidewards
xnoremap <  <gv
xnoremap >  >gv

nnoremap <leader>s :%s/

nnoremap ! :!
" save when cursor leaves buffer
autocmd BufLeave,FocusLost * silent! wall
noremap <C-q> :wqa<CR>
" handy sudo
cmap w!! w !sudo tee % >/dev/null

set inccommand=split
set gdefault
set foldnestmax=1
" hate it when vim auto fold something for me, I'll decide when to fold and
" unfold, motherfucker
set nofoldenable
set clipboard=unnamed
set autoread
set lazyredraw
set visualbell
set noerrorbells
set nobackup
set noswapfile
set mouse=
set wildignore+=*/tmp/*,*.so,*.pyc,\.ropeproject
set wildignorecase
set wildmenu
set wildmode=longest:full,full
set maxmempattern=2000
set nonumber

" scrolling {
set scrolloff=5
set backspace=indent,eol,start
" }

" vim user interface {
highlight NonText ctermfg=0
set termencoding=utf-8
set fillchars=eob:\ ,vert:\ 
" Open new split panes to right and bottom, which feels more natural than
" Vim’s default
set splitbelow
set splitright
set background=dark

colorscheme solarized
" hide tildes
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
highlight Comment cterm=italic
" make tilde sign darker
" }

" filetype handling {
set nowrap

autocmd FileType cfg set filetype=conf
autocmd BufRead,BufNewFile *.conf set filetype=dosini
autocmd BufRead,BufNewFile *.cfg set filetype=dosini
autocmd BufRead,BufNewFile pip-req.txt set filetype=requirements
autocmd BufRead,BufNewFile *.geojson set filetype=json
autocmd BufRead,BufNewFile *.zsh-theme set filetype=zsh
autocmd BufRead,BufNewFile .envrc set filetype=sh
autocmd BufRead,BufNewFile *.hql set filetype=hive expandtab
autocmd BufRead,BufNewFile *.q set filetype=hive expandtab

autocmd FileType qf setlocal nonumber
autocmd FileType man setlocal nonumber wrap
autocmd FileType python setlocal nonumber nowrap
autocmd FileType Jenkinsfile setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType vue setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2
autocmd FileType htmldjango setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2
autocmd FileType zsh setlocal shiftwidth=2
autocmd FileType sh setlocal shiftwidth=2
autocmd FileType lua setlocal expandtab shiftwidth=2 softtabstop=2
" see https://github.com/posva/vim-vue#my-syntax-highlighting-stops-working-randomly
autocmd FileType vue syntax sync fromstart
" }
" }

" vim plugin config {

" ack.vim {
let g:ackprg = 'ag --nogroup --nocolor --column'
cnoreabbrev Ack Ack!
" }

" golden-ratio {
let g:golden_ratio_exclude_nonmodifiable = 1
" }

" ultisnips {
let g:UltiSnipsExpandTrigger = "<C-l>"
" }

" vim-snippets {
let g:snips_email = 'kkcocogogo@gmail.com'
let g:snips_author = 'timfeirg'
let g:snips_github = 'https://github.com/timfeirg/'
" }

" neovim-LanguageClient {
let g:LanguageClient_serverCommands = {
            \ 'lua': ['lua-lsp'],
            \ 'vue': ['vls'],
            \ 'python': ['pyls'],
            \ 'go': ['go-langserver'],
            \ 'sh': ['bash-language-server', 'start'],
            \ 'dockerfile': ['docker-langserver', '--stdio'],
            \ }
set signcolumn=no
let g:LanguageClient_diagnosticsList = "Disabled"
lef g:LanguageClient_diagnosticsEnable = 0
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition({'gotoCmd': 'vsplit'})<CR>
nnoremap <silent> <C-c>rr :call LanguageClient#textDocument_rename()<CR>
" }

" deoplete {
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
    return deoplete#close_popup() . "\<CR>"
endfunction
let g:deoplete#enable_smart_case = 1
" use tab / shift-tab to cycle through candidates
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" call deoplete#custom#source('_', 'matchers', ['matcher_cpsm'])
call deoplete#custom#var('buffer', 'require_same_filetype', v:false)
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
call deoplete#custom#option('smart_case', v:true)
" see https://muunyblue.github.io/520bae6649b42ff5a3c8c58b7fcfc5a9.html
call deoplete#custom#option('sources', {
            \ '_': ['buffer', 'ultisnips'],
            \ 'python': ['ultisnips', 'LanguageClient', 'buffer'],
            \ 'go': ['ultisnips', 'go', 'buffer'],
            \ 'vue': ['ultisnips', 'LanguageClient', 'buffer'],
            \ 'sh': ['ultisnips', 'buffer', 'LanguageClient'],
            \ 'lua': ['ultisnips', 'buffer', 'LanguageClient'],
            \ 'dockerfile': ['ultisnips', 'buffer', 'LanguageClient'],
            \})
" automatically close the scratch window
" see https://gregjs.com/vim/2016/configuring-the-deoplete-asynchronous-keyword-completion-plugin-with-tern-for-vim/
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" }

" jedi-vim {
let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_command = '<C-c>g'
let g:jedi#goto_definitions_command = ''  " dynamically done for ft=python.
let g:jedi#use_tabs_not_buffers = 0  " current default is 1.
let g:jedi#rename_command = '<C-c>rr'
let g:jedi#usages_command = '<Leader>gu'
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 1
let g:jedi#documentation_command = 'K'
let g:jedi#auto_close_doc = 1
let g:jedi#use_splits_not_buffers = 'winwidth'
" }

" pymode python-mode {
" pymode is useless except for the rope features, so I disabled everything
let g:pymode_rope = 1
let g:pymode_folding = 0
let g:pymode_rope_goto_definition_bind = '<nop>'
let g:pymode_rope_organize_imports_bind = '<nop>'
let g:pymode_rope_rename_bind = '<nop>'
let g:pymode_rope_ropefolder = '../.ropeproject'
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport_import_after_complete = 1
let g:pymode_lint = 0
let g:pymode_run = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_python = 'python3'
let g:pymode_syntax = 0
let g:pymode_virtualenv = 1
" }

" isort {
let g:vim_isort_python_version = 'python3'
noremap <silent> <C-c>ro :call pymode#rope#organize_imports()<CR>:Isort<CR>
" }

" vim-go {
autocmd FileType go set foldmethod=syntax
autocmd FileType go nnoremap <C-c>rr :GoRename<CR>
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
" }

" lua {
let g:lua_inspect_warnings = 0
" }

" multi cursor {
" let multiple cursors work with YouCompleteMe
function! Multiple_cursors_before()
    let g:ycm_auto_trigger = 0
endfunction

function! Multiple_cursors_after()
    let g:ycm_auto_trigger = 1
endfunction
" }

" NERDtree {
" the origin T wasn't much use, so I remap both T and t: T for Tree and t for
" tags looks intuitive to me
nnoremap T :NERDTreeToggle %<cr>
let NERDTreeShowFiles=1
let NERDTreeRespectWildIgnore=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
" disable some of the nerdtree commands to map T to open nerdtree
let NERDTreeMapOpenInTabSilent='<nop>'
let NERDTreeMapOpenInTab='<nop>'
" be consistent with ctrlspace, use v for open in v split
let g:NERDTreeMapOpenVSplit='v'
" }

" tcommenter {
let g:tcomment_opleader1 = '<leader>c'
" }

" airline {
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1
let g:airline_section_b = ''
let g:airline_section_x = ''
let g:airline_section_y = ''
" without this line, airline won't load until there's split windows
set laststatus=2
" don't show mode in the bottom line
set noshowmode
" }

" easymotion {
" the original f deal with single line navigation, and most movements are not
" within a single line, so I map f to a more powerful easymotion command
nmap f <Plug>(easymotion-s)
omap F <Plug>(easymotion-bd-w)
nmap F <Plug>(easymotion-bd-w)
vmap F <Plug>(easymotion-bd-w)
let g:EasyMotion_use_upper = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_inc_highlight = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_skipfoldedline = 0
" }

" table mode {
let g:table_mode_corner_corner = '-'
let g:table_mode_corner = '-'
" }

" ale {
let g:ale_set_highlights = 0
let g:ale_open_list = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
let g:ale_echo_msg_format = '%linter%:%code% %s'
let g:ale_loclist_msg_format = '%linter%:%code% %s'
let g:ale_linters = {
            \ 'go': ['gometalinter'],
            \ 'python': ['flake8']
            \ }
let g:ale_fixers = {
            \ 'python': ['yapf'],
            \ 'rust': ['rustfmt'],
            \ 'javascript': ['prettier', 'eslint']
            \ }
let g:ale_go_gometalinter_options = '--vendor --fast --disable=gocyclo
            \ --exclude="should have comment"
            \ --exclude="should be of the form"
            \ --exclude="Errors unhandled"
            \ --exclude="weak cryptographic"
            \ --exclude="weak random"'
let g:ale_python_flake8_options = '--ignore=E501,E225,E203,E702,F811,F405'
autocmd BufEnter ControlP let b:ale_enabled = 0
" }

" identation {
set showtabline=0
set autoindent
set showmatch
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
" }

" choosewin {
" Display window label in the middle of each window
map - <Plug>(choosewin)
" }

" vim-maximizer {
nnoremap <leader>- :MaximizerToggle<CR>
" }

" ctrlp and plugins {
let g:ctrlp_mruf_case_sensitive = 0
let g:ctrlp_map = '<nop>'
let g:ctrlp_tilde_homedir = 1
let g:ctrlp_extensions = ['funky']
let g:ctrlp_custom_ignore = {
            \ 'dir':  'node_modules\|DS_Store\|vendor\|_book',
            \ 'file': '\v\.(log|so|pyc)$',
            \ }
nnoremap <C-@> :CtrlPMixed<CR>
nnoremap <C-space> :CtrlPMixed<CR>
" show all history vim commands and enter fuzzy search
nnoremap <leader>; :CtrlPCmdline<CR>
" yankring {
let g:ctrlp_yankring_limit = 100
nnoremap <leader>p :CtrlPYankring<CR>
" }
" funky {
let g:ctrlp_funky_use_cache = 1
" after jump, move code to the center and open fold recursively
let g:ctrlp_funky_after_jump = 'zOzt'
let g:ctrlp_funky_nerdtree_include_files = 1
let g:ctrlp_funky_sort_by_mru = 1
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_follow_symlinks = 1
" t stands for tags
nnoremap t :CtrlPFunky<Cr>
nnoremap <leader>/ :CtrlPSearchHistory<CR>
" }
" }

" vim-easyclip {
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipUseYankDefaults = 0
" M will cut till end of line, just like D to d
nmap M m$
nnoremap gm m
"

" vim asterisk {
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)
" }

" vim csv {
let g:csv_highlight_column = 'y'
" }

" incsearch {
set hlsearch
set ignorecase
set smartcase
set incsearch
set showmatch
let g:incsearch#auto_nohlsearch = 1
map n <Plug>(incsearch-nohl-n)
map N <Plug>(incsearch-nohl-N)
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
" }

" }
