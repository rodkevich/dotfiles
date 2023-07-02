"" -- leader key
let mapleader="\<SPACE>"

" -- Plugins: download under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" -- list of used plugins.
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
" Plug 'NLKNguyen/papercolor-theme'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ryanoasis/vim-devicons'
" --
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
" --
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
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons' " optional

Plug 'phaazon/hop.nvim' " https://github.com/phaazon/hop.nvim
Plug 'jistr/vim-nerdtree-tabs'
Plug 'terryma/vim-expand-region' " [+] [-]

Plug 'rmagatti/goto-preview'
call plug#end()

" -- Settings
filetype on
syntax on
filetype plugin indent on " Allow auto-indenting depending on file type

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
set relativenumber
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
set wildmode=list:full                " make tab completion for files/buffers act like bash
" -- search options
set ignorecase
set smartcase
set scrolloff=4        " Keep the cursor centered in the screen 999
set showtabline=1
set foldmethod=indent
set foldnestmax=1

" -- colors
set background=dark
colorscheme doom-one


" colorscheme PaperColor

map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>, :Tags<CR>
nnoremap <leader>m :Marks<CR>

"  -- Airline
let g:airline_theme='onedark'
let g:airline_powerline_fonts=1
let g:airline#extension#tabline#enable=1
let g:airline#extension#tabline#left_sep=' '
let g:airline#extension#tabline#left_alt_sep='|'
let g:airline#extension#tabline#formatter='unique_tail'

" -- Refresh suggestions on backspace
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" -- Bindings

" Shortcut to yanking to the system clipboard
map <leader>y "+y
map <leader>p "+p

" -- toggle terminal
let g:floaterm_keymap_toggle = '<F3>'

" -- fuzzyfinder plugin key mapping
map ' :Files<CR> 

" -- remap VIM 0 to first non-blank character
map 9 ^
map 0 $
map 5 %

nnoremap <S-s> :w!<cr>
nnoremap <S-w> :q!<CR>
nnoremap <ESC> :bd<CR>

" -- Tabs
nnoremap <S-Tab> gT
nnoremap <Tab> gt
nnoremap <S-t> :tabnew<CR>

" -- search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" -- same when moving up and down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" -- Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

nmap <leader>cd :cd %:h<CR>

" -- Don't move on *. Use n if needed
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" -- Visual Mode 
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

" -- Visual mode pressing * or # searches for the current selection
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" -- Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> :HopPattern<cr>
map <space> /
map <C-space> ?

" -- Opens a new tab with the current buffer's path
nnoremap <F4> :tabedit <c-r>=expand("%:p:h")<cr>/

" -- Move a line of text using ALT+[jk] or Command+[jk] on mac
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

" -- create a go doc comment based on the word under the cursor
function! s:create_go_doc_comment()
  norm "zyiw
  execute ":put! z" 
  execute ":norm I// \<Esc>$" | execute ":norm A "
endfunction
nnoremap <leader>ic :<C-u>call <SID>create_go_doc_comment()<CR>


" -- Nerdtree plugin:
" -- close nerd tree on file load
let NERDTreeQuitOnOpen=0
" -- create default mappings
let g:NERDCreateDefaultMappings = 1
" -- add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" -- use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" -- align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" -- set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" -- add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" -- split posititon on screen
let g:NERDTreeWinPos = "left"

" -- Nerdcomment plugin
" -- allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" -- enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" -- enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" -- Git blame
vnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gb :Git blame<CR>

nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>ww <C-w><C-w>

function! ToggleNERDTreeFind()
     if g:NERDTree.IsOpen()
        execute ':NERDTreeClose'
    else
      if bufname('%') == ''
          execute ':NERDTreeTabsOpen'
      else
          execute ':NERDTreeFind'
      endif
    endif
endfunction

nnoremap  <leader>e  :call ToggleNERDTreeFind()<CR>
" -- Navigation plugin
" nnoremap <leader>e :NERDTreeToggle % <CR>
" nnoremap <F1> :NERDTreeTabsFind<CR>
nnoremap <F2> :GoRename<CR>
nnoremap <leader>1 :NvimTreeFindFileToggle<CR>
nnoremap <leader>2 :TagbarToggle<CR>

let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 0
let g:tagbar_compact   = 1
let g:tagbar_width = max([30, winwidth(0) / 5])
let g:tagbar_left = 1
let g:tagbar_indent =1	 

"open tagbar for each file
" autocmd BufEnter * nested :call tagbar#autoopen(0)

autocmd VimEnter *.py,*.pl,*.js,*.go NvimTreeFindFileToggle

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

" Highlight
" setup Go syntax highlighting
let g:go_fold_enable = ['import', 'package_comment']
let g:go_highlight_variable_declarations = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_assignments = 1

" -- Settings for vim-go plugin
let g:go_auto_type_info = 0 
let g:go_doc_popup_window = 1
let g:go_doc_balloon = 1
let g:go_doc_max_height = 25
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports" 
let g:go_imports_autosave=1
let g:go_imports_mode="gopls"
let g:go_gopls_complete_unimported = 1
let g:go_gopls_gofumpt = 1
let g:go_list_type = "quickfix"
let g:go_rename_command="gopls"
let g:go_test_show_name = 1
let g:go_fmt_options=1
let g:go_get_update = 0

let g:go_debug_windows = {
      \ 'vars':  'leftabove 35vnew',
      \ 'stack': 'botright 10new',
\ }

" put imports of packages from the current module in their own group
autocmd FileType go let b:go_fmt_options = {
    \ 'goimports': '-local ' .
      \ trim(system('{cd '. shellescape(expand('%:h')) .' && go list -m;}')),
    \ }

" -- go mappings
augroup go
  autocmd!
  " autocmd FileType go silent exe "GoGuruScope " . go#package#ImportPath(expand('%:p:h')) . "..."
  " autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)
  " autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
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

" -- Fold toggle by F9
noremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

noremap <leader>3 zR<cr>
noremap <leader>4 zM<cr>

noremap <leader>f <C-O>za
nnoremap <leader>f za
onoremap <leader>f <C-C>za
vnoremap <leader>f zf

" -- No more Arrow Keys, deal with it
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Startup screen settings
" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:rooter_patterns = ['.git', 'Makefile', 'go.mod', '*.sln', 'build/env.sh']

" Customize fzf colors to match your color scheme
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

" from:
" https://www.chiarulli.me/Neovim/08-fzf/

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)


" bookmarks help
" https://github.com/mhinz/vim-startify/issues/135
" https://www.chiarulli.me/Neovim/11-startify/
nnoremap <leader>5 :Startify<cr>

let g:startify_custom_header = [
            \ '   - vim -  ',
            \ ]

let g:startify_change_to_vcs_root= 1
let g:startify_padding_left = 7
let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")

let g:startify_lists = [
    \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
    \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'files',     'header': ['   Recent']            },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'commands',  'header': ['   Commands']       },
    \ ]

if exists("g:neovide")
    " Put anything you want to happen only in Neovide here
    let g:neovide_refresh_rate = 100
    let g:neovide_confirm_quit = v:true
    let g:neovide_remember_window_size = v:true
    let g:neovide_cursor_animation_length=0.025
    let g:neovide_cursor_trail_size = 0.3
endif

" - remove backgrounds when splitting windows likw nerdtree 
highlight VertSplit ctermbg=NONE
highlight VertSplit ctermfg=NONE

" -- Autocommands

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %
" Auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.config/nvim/.vimrc
" Automatically resize screens to be equally the same
autocmd VimResized * wincmd =
" -- create directories if route doesn't exist
autocmd BufNewFile * silent! !mkdir -p $(dirname %)

" -- Completion + Snippet
" Ultisnips has native support for SuperTab. SuperTab does omni completion by
" pressing tab. I like this better than autocompletion, but it's still fast.
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" -- Various other plugin settings
nmap  -  <Plug>(choosewin)

augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/3
augroup END
au! VCenterCursor
" -- https://github.com/charmbracelet/glow
" -- https://github.com/JASONews/glow-hover.nvim
" highlight! HoverFloatBorder ctermbg=None ctermfg=255
" hi Normal guibg=NONE ctermbg=NONE
" transparent bg
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" For Vim<8, replace EndOfBuffer by NonText
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE

" -- LUA from here:

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
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  ---
  on_attach = my_on_attach,
  ---
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

--https://vimawesome.com/plugin/hop-nvim#using-vim-plug
-- place this in one of your configuration file(s)
local hop = require('hop')
local directions = require('hop.hint').HintDirection

--vim.api.nvim_set_keymap('n', '$', "<cmd>lua require'hop'.hint_words()<cr>", {})

vim.keymap.set('', 'f', function() hop.hint_patterns() end, {remap=true})
vim.keymap.set('', 'F', function() hop.hint_char1() end, {remap=true})
vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})

require'hop'.setup()

require'glow-hover'.setup {
       -- The followings are the default values
       max_width = 50,
       padding = 10,
       border = 'shadow',
       glow_path = 'glow'
   }

EOF
