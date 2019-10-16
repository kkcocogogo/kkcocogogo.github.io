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
" Plug 'roman/golden-ratio'
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

Plug 'valloric/matchtagalways'
Plug 'mattn/emmet-vim'
Plug 'chrisbra/csv.vim'
Plug 'fatih/vim-go'
Plug 'dart-lang/dart-vim-plugin'
Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'

" better python folding
Plug 'tmhedberg/SimpylFold'

" filetypes not handled above will be handled by polyglot
Plug 'sheerun/vim-polyglot'

" }

" vim UI {

" fancy simbols on the command line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'lifepillar/vim-solarized8'
" }

call plug#end()
" }

" general vim settings {

" nobody uses exmode
nnoremap Q <Nop>

augroup ClearUndo
    autocmd!
    autocmd VimLeave * !rm -rf ~/.nvim/undodir/*
augroup END
set undofile
set undodir=~/.nvim/undodir

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
" write and then git add
cmap gw Gwrite \| q
cmap gn Gwrite \| n

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
set nowritebackup
set noswapfile
set mouse=
set wildoptions=pum
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
set termguicolors
colorscheme solarized8
" }

" filetype handling {
set nowrap

autocmd FileType cfg set filetype=conf
autocmd BufRead,BufNewFile *.conf set filetype=dosini
autocmd BufRead,BufNewFile *.cfg set filetype=dosini
autocmd BufRead,BufNewFile requirements*.txt set filetype=requirements
autocmd BufRead,BufNewFile *.geojson set filetype=json
autocmd BufRead,BufNewFile *.zsh-theme set filetype=zsh
autocmd BufRead,BufNewFile .envrc set filetype=sh
autocmd BufRead,BufNewFile *.hql set filetype=hive expandtab
autocmd BufRead,BufNewFile *.q set filetype=hive expandtab
au BufNewFile,BufRead *.html.j2 set ft=html
au BufNewFile,BufRead *.yml.j2,*.yaml.j2 set ft=yaml

autocmd FileType yaml setlocal indentkeys-=<:> expandtab shiftwidth=2 softtabstop=2
autocmd FileType requirements setlocal commentstring=#\ %s
autocmd FileType dockerfile setlocal expandtab shiftwidth=4 softtabstop=4
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
let g:ack_autoclose = 0
" using location list allows quick navigation using [l and ]l
cnoreabbrev ag LAck!
let g:ack_mappings = { "h": "h", "s": "<C-W><CR><C-W>K" }
" }

" golden-ratio {
let g:golden_ratio_exclude_nonmodifiable = 1
" }

" ultisnips {
let g:UltiSnipsExpandTrigger = "<C-l>"
" }

" auto-pairs {
au FileType python let b:AutoPairs = AutoPairsDefine({'"""' : '"""', "'''": "'''"})
au FileType vim let b:AutoPairs = {'<' : '>', '(': ')', "'": "'", '{': '}'}
" }

" }

" vim-snippets {
let g:snips_email = 'kkcocogogo@gmail.com'
let g:snips_author = 'timfeirg'
let g:snips_github = 'https://github.com/timfeirg/'
" }

" neovim-LanguageClient {
let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
let g:LanguageClient_useVirtualText = 0
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_serverCommands = {
            \ 'dart': ['dart', '/usr/local/opt/dart/libexec/bin/snapshots/analysis_server.dart.snapshot', '--lsp'],
            \ 'lua': ['lua-lsp'],
            \ 'vue': ['vls'],
            \ 'python': ['pyls'],
            \ 'go': ['go-langserver'],
            \ 'sh': ['bash-language-server', 'start'],
            \ 'dockerfile': ['docker-langserver', '--stdio'],
            \ 'html': ['html-languageserver', '--stdio'],
            \ 'css': ['css-languageserver', '--stdio'],
            \ }
set signcolumn=no
let g:LanguageClient_diagnosticsList = "Disabled"
" lef g:LanguageClient_diagnosticsEnable = 0
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition({'gotoCmd': 'vsplit'})<CR>
nnoremap <silent> <C-c>rr :call LanguageClient#textDocument_rename()<CR>
" }

" better-whitespace {
let g:show_spaces_that_precede_tabs = 1
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
" use tab / shift-tab to cycle through candidates
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
call deoplete#custom#var('buffer', 'require_same_filetype', v:false)
" call deoplete#custom#source('_', 'matchers', ['matcher_cpsm'])
" call deoplete#custom#source('_', 'sorters', [])
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
call deoplete#custom#option({
            \ 'auto_complete_delay': 1,
            \ 'auto_refresh_delay': 1,
            \ 'smart_case': v:true,
            \ 'on_insert_enter': v:false,
            \ })

" see https://muunyblue.github.io/520bae6649b42ff5a3c8c58b7fcfc5a9.html
call deoplete#custom#option('sources', {
            \ '_': ['file', 'around', 'buffer', 'ultisnips', 'LanguageClient'],
            \ 'python': ['file', 'around', 'ultisnips', 'LanguageClient', 'buffer'],
            \ 'go': ['file', 'around', 'ultisnips', 'go', 'buffer'],
            \ 'vue': ['file', 'around', 'ultisnips', 'LanguageClient', 'buffer'],
            \ 'sh': ['file', 'around', 'ultisnips', 'buffer', 'LanguageClient'],
            \ 'lua': ['file', 'around', 'ultisnips', 'buffer', 'LanguageClient'],
            \ 'dockerfile': ['file', 'around', 'ultisnips', 'buffer', 'LanguageClient'],
            \})
" automatically close the scratch window
" see https://gregjs.com/vim/2016/configuring-the-deoplete-asynchronous-keyword-completion-plugin-with-tern-for-vim/
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" }

" jedi-vim {
let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_command = '<C-c>g'
let g:jedi#goto_definitions_command = ''  " dynamically done for ft=python.
let g:jedi#use_tabs_not_buffers = 0  " current default is 1.
let g:jedi#rename_command = '<C-c>rr'
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#documentation_command = 'K'
let g:jedi#auto_close_doc = 1
let g:jedi#use_splits_not_buffers = 'winwidth'
let g:jedi#auto_initialization = 0
" }

" dart {
let dart_html_in_string=v:true
let dart_style_guide = 2
let dart_format_on_save = 1
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
nnoremap T :NERDTree %<cr>
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

" vim-polyglot {
let g:polyglot_disabled = ['yaml', 'jinja']
" ansible-vim indentexpr is buggy!
autocmd FileType yaml.ansible setlocal indentexpr=
" }

" airline {
let g:airline#extensions#languageclient#enabled = 0
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

" fugitive {
cnoreabbrev gd Gvdiff
cnoreabbrev gb Gblame
" }

" ale {
let g:airline#extensions#ale#enabled = 0
let g:ale_set_highlights = 0
let g:ale_open_list = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_format = '%linter%:%code% %s'
let g:ale_loclist_msg_format = '%linter%:%code% %s'
let g:ale_go_go111module = 'ON'
let g:ale_linters = {
            \ 'go': ['golangci-lint'],
            \ 'python': ['flake8']
            \ }
let g:ale_fixers = {
            \ 'rust': ['rustfmt'],
            \ 'python': ['black'],
            \ 'html': ['tidy'],
            \ 'javascript': ['prettier', 'eslint']
            \ }
let g:ale_python_black_options = '--skip-string-normalization'
let g:ale_python_flake8_options = '--ignore=E402,E501,E722,E731,E225,E203,E702,F811,F405,F403,W391,F401,W503,W504'
let g:ale_python_pylint_options = '--disable=broad-except,logging-not-lazy,too-many-return-statements,C0111,R0903,too-many-arguments,too-many-locals,invalid-name,fixme,logging-fstring-interpolation,line-too-long,no-member,inconsistent-return-statements,too-many-lines,unused-argument,no-self-use'
autocmd BufEnter ControlP let b:ale_enabled = 0
" }

" identation {
set showtabline=0
set autoindent
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
