" -- NOTES 
" -- https://github.com/jhawthorn/fzy

" -- leader key
let mapleader="\<SPACE>"

" -- ubudovy: spampavać da ukazanaj dyrektoryi
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" -- spis vykarystoŭvanych ubudoŭ
Plug 'hashivim/vim-hashicorp-tools'
Plug 'AndrewRadev/splitjoin.vim' " [gS] [gJ]
Plug 'shmup/vim-sql-syntax'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ellisonleao/glow.nvim'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'JASONews/glow-hover'
Plug 'preservim/nerdcommenter'
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'NLKNguyen/papercolor-theme'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'voldikss/vim-floaterm'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'L3MON4D3/LuaSnip'
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }

Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'nvim-neotest/neotest-go'
Plug 'nvim-neotest/neotest'

Plug 'romgrk/doom-one.vim'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons' " nieabaviazkovy
Plug 'phaazon/hop.nvim' 
Plug 'terryma/vim-expand-region' " [+] [-]
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'rmagatti/goto-preview'
Plug 'https://github.com/alok/notational-fzf-vim'
Plug 'JASONews/glow-hover'
call plug#end()

" -- Ahuĺnyja nalady
filetype on
syntax on
" -- Dazvolić aŭtamatyčny vodstup u zalieźnasci ad typu fajla
filetype plugin indent on 

set autoindent
set autoread
set autowrite
set backspace=eol,start,indent
set clipboard^=unnamed
set clipboard^=unnamedplus
set completeopt=menuone,preview
set encoding=UTF-8
set hidden
set hlsearch
set inccommand=split
set incsearch
set lazyredraw
set laststatus=2
set linebreak
set mouse=a
set nocompatible
set nocursorcolumn
set nocursorline
set noerrorbells
set noswapfile
set nobackup
set nowb
set number
set showmatch
set splitbelow splitright
set title
set ttyfast
set maxmempattern=20000
set wildmenu
set wrap
" -- prymusić auto-zaviaršennie fajlau abo bufieraŭ dziejničać jak u bash
set wildmode=list:full
" -- paramietry pošuku
set ignorecase
set smartcase
" -- trymać kursor u centry ekrana
set scrolloff=4
set showtabline=1
set foldmethod=syntax "manual
set foldnestmax=1
set foldcolumn=1
" -- koliery
set background=dark
colorscheme doom-one
" colorscheme papercolor
" set background=light
" -- vydalić [~] i [|] simvaly
set fillchars=eob:\ 
set fillchars+=vert:\ 

" -- vylučyć numar radka kursora 
" -- [biez radka kursora]
set cursorline
set cursorlineopt=number
" Do not show matching brackets by flickering
set noshowmatch
set viminfo='1000

" -- ubudoba dlia natatak
nnoremap <silent> <leader>n :NV<CR>

" -- pierakliučennie pamiž dvuma apošnimi bufierami
nnoremap <silent> <0> <cmd>exe v:count ? v:count . 'b' : 'b' . (bufloaded(0) ? '#' : 'n')<cr>

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" -- pamier akna dreva fajlaŭ
let NERDTreeWinSize=20

" -- pierapryviazać haračuju klavišu kamientavannia
let g:NERDCreateDefaultMappings =  0
nmap <leader>cc <plug>NERDCommenterInvert<CR>
xmap <leader>cc <plug>NERDCommenterInvert<CR>

" -- https://github.com/alok/notational-fzf-vim
let g:nv_search_paths = ['~/_wiki', '~/_notes', '~/code', 'docs.md' , './notes.md']

" -- TELESCOPE

" -- https://nvimluau.dev/nvim-telescope-telescope-nvim#getting-started
nnoremap <leader>e <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap ' <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>, <cmd>lua require('telescope.builtin').help_tags()<cr>

" -- https://github.com/charmbracelet/glow
" -- https://github.com/JASONews/glow-hover.nvim
highlight! HoverFloatBorder ctermbg=None ctermfg=255

" -- previw markdown in vim
nmap <leader>o :Glow %<cr>

" -- vydalić bliki 
" -- [dlia vykarystannia z prazrystym terminalam]
hi CursorLineNr guifg=LightCyan
hi CursorLineNr guibg=NONE
hi LineNr guibg=NONE
hi Folded guibg=NONE
hi FoldColumn guibg=NONE
hi SignColumn guibg=NONE
hi NonText guifg=NONE
hi NonText guibg=NONE
hi VertSplit guibg=bg guifg=bg

" let g:terraform_fold_sections=1

" -- dadać prabiel pry padvojnym nacisku u zvyčajnym režymie
nmap <space><space> a<space><ESC>h

"  -- AIRLINE
let g:airline_theme='onedark'
let g:airline_powerline_fonts=1
let g:airline#extension#tabline#enable=1
let g:airline#extension#tabline#left_sep=' '
let g:airline#extension#tabline#left_alt_sep='|'
let g:airline#extension#tabline#formatter='unique_tail'

" -- abnavić prapanovy na Backspace
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" -- jarlyk dlia pieramiaščennia ŭ sistemny bufier abmienu
map <leader>y "+y
map <leader>p "+p

" -- pierakliučyć terminal
let g:floaterm_keymap_toggle = '<F1>'

" -- uvajsci u kataloh i pakazać fajly
map <leader>we :cd %:h<bar> :Files<CR>

" -- kiravannie bufierami
nnoremap <S-s> :w!<cr>
nnoremap <S-w> :q!<CR>
nnoremap <ESC> :bd<CR>

" -- kiravannie ŭkladkami
nnoremap <S-Tab> gT
nnoremap <Tab> gt
nnoremap <S-t> :tabnew<CR>

" -- pošuk budzie skancentravany na radku, u jakim jon znojdzieny
nnoremap n nzzzv
nnoremap N Nzzzv

" -- toje ž samaje pry ruchu ŭvierch i ŭniz
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" -- pieranaznačyć H i L 
" -- (vierchniaja, nižniaja častka ekrana na lievy i pravy kaniec radka)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" -- uva ŭ kataloh
nmap <leader>w :cd %:h<CR>

" -- nie ruchacca daliej pa [*]. 
" -- pry nieabchodnasci vykarystoŭvajcie [n]
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" -- vizuaĺny režym
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

" -- vizuaĺny režym, nacisk [*] abo [#] šukaje biahučy vyba
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" -- zviazać [<space> /] (pošuk) i [Ctrl-<space> ?] (pošuk nazad)
map <space> /
map <C-space> ?

" -- adkryvaje novuju ŭkladku z biahučym šliacham da bufiera
nnoremap <F4> :tabedit <c-r>=expand("%:p:h")<cr>/
nnoremap <S-n> :tabedit <c-r>=expand("%:p:h")<cr>/

nmap <M-a> <NOP>
nmap <M-s> <NOP>
nmap <M-d> <NOP>
nmap <M-f> <NOP>
nmap <M-g> <NOP>
nmap <M-h> <NOP>
nmap <M-k> <NOP>
nmap <M-j> <NOP>
nmap <M-l> <NOP>
nmap <M-3> <NOP>

" -- pieramiaščać radok tekstu 
" -- z dapamohaj ALT+[jk] abo Command+[jk] na mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" -- stvaryć kamientar GO DOC na asnovie slova pad kursoram
function! s:create_go_doc_comment()
  norm "zyiw
  execute ":put! z" 
  execute ":norm I// \<Esc>$" | execute ":norm A "
endfunction

" -- dadać camentar go funkcyi
nnoremap <leader>ic :<C-u>call <SID>create_go_doc_comment()<CR>

" -- pierakliučyć akno chutkaha vypraŭliennia
let g:quickfix_is_open = 0
function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

nnoremap <leader>q :call QuickfixToggle()<cr>

" -- Nerdtree plugin:
let NERDTreeQuitOnOpen=0
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDTreeWinPos = "left"

" -- nerdcomment plugin
" -- dazvolić kamientavać i inviertavać pustyja radki (karysna pry kamientavanni rehijonu)
let g:NERDCommentEmptyLines = 1
" -- ukliučyć abrazannie kančatkovych prabielaŭ pry vydalienni kamientaryjaŭ
let g:NERDTrimTrailingWhitespace = 1
" -- pravieryć, kamiencirujucca ci nie kamiencirujucca ŭsie vybranyja radki
let g:NERDToggleCheckAllLines = 1

" -- git blame
vnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gb :Git blame<CR>

" -- kiravannie padzielienymi voknami
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>ww <C-w><C-w>

" -- adkryć dreva
nnoremap <M-1> <plug>NERDTreeTabsToggle<CR>
nnoremap <M-2> :NvimTreeFindFileToggle!<CR>
nnoremap <leader>2  :e ./
nnoremap <F2> :GoRename<CR>
nnoremap ; :TagbarToggle<CR>

" -- TAGBAR
let g:tagbar_autoclose = 0
let g:tagbar_autofocus = 1
let g:tagbar_compact   = 1
let g:tagbar_width = max([55, winwidth(0) / 4])
let g:tagbar_position = 'botright vertical'
let g:tagbar_indent =3	

let g:tagbar_visibility_symbols = {
        \ 'public'    : '+ ',
        \ 'protected' : '# ',
        \ 'private'   : '- '
        \ }

let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'e:embedded',
            \ 'n:interfaces',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'w:fields',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" -- padsviatliennie tekstu
" -- naladzić padsviatliennie sintaksisu Go
let g:go_highlight_build_constraints = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 0
let g:go_highlight_function_parameters = 0
let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
" -- zhortvannie koda
let g:go_fold_enable = ['import', 'comment', 'package_comment']

" nnoremap zC :action CollapseRegionRecursively<CR>
" nnoremap zO :action ExpandRegionRecursively<CR>

" -- nalady plahina vim-go
let g:go_auto_type_info = 0
let g:go_doc_popup_window = 1
let g:go_doc_balloon = 1
let g:go_doc_max_height = 25
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_imports_autosave = 1
let g:go_imports_mode="gopls"
let g:go_gopls_complete_unimported = 1
let g:go_gopls_gofumpt = 1
let g:go_list_type = "quickfix"
let g:go_rename_command = "gopls"
let g:go_test_show_name = 1
let g:go_fmt_options = 1
let g:go_get_update = 0
let g:go_debug_windows = {
      \ 'vars':  'leftabove 35vnew',
      \ 'stack': 'botright 10new',
\ }

" -- zmiascić impart pakietaŭ z biahučaha modulia ŭ svaju hrupu
autocmd FileType go let b:go_fmt_options = {
    \ 'goimports': '-local ' .
      \ trim(system('{cd '. shellescape(expand('%:h')) .' && go list -m;}')),
    \ }

" -- supastaŭliennie kliučoŭ plahina dlia golang
augroup go
  autocmd!
  autocmd FileType go nmap <silent> <Leader>R <Plug>(go-run) %<CR>
  autocmd FileType go nmap <silent> <Leader>r <Plug>(go-run-tab) %<CR>
  autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <silent> <Leader>d <Plug>(go-def-tab)
  autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)

  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" -- pierakliučać ŭzroŭni zhortvannia koda
noremap 0 zM
noremap 9 zR

" -- skladannie z dapamohaj klavišy [f].
noremap <leader>f <C-O>za
nnoremap <leader>f za
onoremap <leader>f <C-C>za
vnoremap <leader>f zf

" -- niama boĺš klaviš sa strelkami, razbiaryciesia z hetym
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" -- Nalady ekrana zapusku:
" -- viartaje ŭsie zmienienyja fajly biahučaha schovišča git
" -- `2>/dev/null` prymušaje kamandu cicha pravaĺvacca, tak što, kali my nie
" -- u git repo, spis budzie pustym
function! s:gitModified()
  let files = systemlist('git ls-files -m 2>/dev/null')
  return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" -- toje samaje, što i vyšej, 
" -- alie pakazvać nieadsočvanyja fajly, ušanoŭvajučy .gitignore
function! s:gitUntracked()
  let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
  return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" -- vyznačyć karaniovy kataloh
let g:rooter_patterns = ['.git', 'Makefile', 'go.mod', '*.sln', 'build/env.sh']

" -- nalada kolieraŭ fzf u adpaviednasci z isnujučaj kaliarovaj hamaj
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" -- https://github.com/mhinz/vim-startify/issues/135
" -- https://www.chiarulli.me/Neovim/11-startify/
nnoremap <leader>1 :Startify<cr>
let g:startify_custom_header = [
            \ '   - Have a nice day! -  ',
            \ ]
let g:startify_change_to_vcs_root= 1
let g:startify_padding_left = 6
let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   Files:']            },
          \ { 'type': 'dir',       'header': ['   Dir: '. getcwd()] },
          \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
          \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]

if exists("g:neovide")
    " -- kladzicie tut usio, što chočacie, toĺki ŭ Neovide
    let g:neovide_refresh_rate = 100
    let g:neovide_confirm_quit = v:true
    let g:neovide_remember_window_size = v:true
    let g:neovide_cursor_animation_length=0.025
    let g:neovide_cursor_trail_size = 0.3
endif

" -- vydalić fon pry padzielie voknaŭ 
highlight VertSplit ctermbg=NONE
highlight VertSplit ctermfg=NONE

" -- AŬTAKAMANDY

" -- aŭtamatyčna ŭvachodzić u kataloh fajlaŭ
autocmd BufEnter * silent! lcd %
" -- aŭtamatyčnaja pierazahruzka vimrc pry jaho redahavanni
autocmd! bufwritepost .vimrc source ~/.config/nvim/.vimrc
" -- aŭtamatyčna zmianiać pamiery ekranaŭ, kab jany byli adnoĺkavymi
autocmd VimResized * wincmd =
" -- stvarać katalohi kali maršrut nie isnuje
autocmd BufNewFile * silent! !mkdir -p $(dirname %)

" -- completion + snippet
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" -- roznyja inšyja nalady plahina
nmap  -  <Plug>(choosewin)

augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/3
augroup END
au! VCenterCursor

" -- prazrysty fon
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" -- dlia Vim<8 zamienicie EndOfBuffer na NonText
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE

" -- LUA adsiuĺ:

" goto-preview:
nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap gp <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
nnoremap gr <cmd>lua require('goto-preview').goto_preview_references()<CR>
:lua require('goto-preview').setup {}

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- snippet engine
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' }, -- For ultisnips users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
 })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- each lsp server you've enabled.
require('lspconfig')['gopls'].setup {
  capabilities = capabilities
}

  -- https://github.com/nvim-tree/nvim-tree.lua
  -- disable netrw at the very start of your init.lua
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- set termguicolors to enable highlight groups
  vim.opt.termguicolors = true

  -- empty setup using defaults
  require("nvim-tree").setup()

  -- OR setup with some options
  require("nvim-tree").setup({
   sort_by = "case_sensitive",
   view = {
     width = 30,
   },
   renderer = {
     group_empty = true,
   },
   filters = {
     dotfiles = true,
   },
  })

  require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
 -- globally enable "strict" selection of icons - icon will be looked up in
 -- different tables, first by filename, and if not found by extension; this
 -- prevents cases when file doesn't have any extension but still gets some icon
 -- because its name happened to match some extension (default to false)
 strict = true;
 -- same as `override` but specifically for overrides by filename
 -- takes effect when `strict` is true
 override_by_filename = {
  [".gitignore"] = {
    icon = "",
    color = "#f1502f",
    name = "Gitignore"
  }
 };
 -- same as `override` but specifically for overrides by extension
 -- takes effect when `strict` is true
 override_by_extension = {
  ["log"] = {
    icon = "",
    color = "#81e043",
    name = "Log"
  }
 };
}
  require'nvim-web-devicons'.has_loaded()
  local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
	on_attach = my_on_attach,
}

  local function tab_win_closed(winnr)
  local api = require"nvim-tree.api"
  local tabnr = vim.api.nvim_win_get_tabpage(winnr)
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local buf_info = vim.fn.getbufinfo(bufnr)[1]
  local tab_wins = vim.tbl_filter(function(w) return w~=winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
  local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
  if buf_info.name:match(".*NvimTree_%d*$") then            -- close buffer was nvim tree
    -- Close all nvim tree on :q
    if not vim.tbl_isempty(tab_bufs) then                      -- and was not the last window (not closed automatically by code below)
      api.tree.close()
    end
  else                                                      -- else closed buffer was normal buffer
    if #tab_bufs == 1 then                                    -- if there is only 1 buffer left in the tab
      local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
      if last_buf_info.name:match(".*NvimTree_%d*$") then       -- and that buffer is nvim tree
        vim.schedule(function ()
          if #vim.api.nvim_list_wins() == 1 then                -- if its the last buffer in vim
            vim.cmd "quit"                                        -- then close all of vim
          else                                                  -- else there are more tabs open
            vim.api.nvim_win_close(tab_wins[1], true)             -- then close only the tab
          end
        end)
      end
    end
  end
end

vim.api.nvim_create_autocmd("WinClosed", {
	callback = function ()
		local winnr = tonumber(vim.fn.expand("<amatch>"))
		vim.schedule_wrap(tab_win_closed(winnr))
	end,
	nested = true
})

-- HOP
--https://vimawesome.com/plugin/hop-nvim#using-vim-plug
-- place this in one of your configuration file(s)
local hop = require('hop')
local directions = require('hop.hint').HintDirection

--vim.api.nvim_set_keymap('n', '$', "<cmd>lua require'hop'.hint_words()<cr>", {})

vim.keymap.set('', 'f', function() hop.hint_patterns() end, {remap=true})
--vim.keymap.set('', 'F', function() hop.hint_char1() end, {remap=true})

require'hop'.setup()

require'glow-hover'.setup {
	-- The followings are the default values
	max_width = 50,
	padding = 10,
	border = 'shadow',
	glow_path = 'glow'
}

-- search like ide
function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})
	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
		else
		return ''
	end
end

local keymap = vim.keymap.set
local tb = require('telescope.builtin')
local opts = { noremap = true, silent = true }

keymap('n', 'F', ':Telescope current_buffer_fuzzy_find<cr>', opts)
keymap('v', 'F', function()
	local text = vim.getVisualSelection()
	tb.current_buffer_fuzzy_find({ default_text = text })
end, opts)

keymap('n', '<space>G', ':Telescope live_grep<cr>', opts)
keymap('v', '<space>G', function()
	local text = vim.getVisualSelection()
	tb.live_grep({ default_text = text })
end, opts)

-- https://github.com/JASONews/glow-hover.nvim
require'glow-hover'.setup( {
	-- The followings are the default values
	max_width = 50,
	padding = 10,
	border = 'shadow',
	glow_path = 'glow'
})

-- https://github.com/ellisonleao/glow.nvim
require('glow').setup( {
	border = "", -- floating window border config
	style = "dark", -- filled automatically with your current editor background, you can override using glow json style
	pager = false,
	width = 80,
	height = 100,
	width_ratio = 0.7, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
	height_ratio = 0.7,
})

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup( {
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
})

EOF
