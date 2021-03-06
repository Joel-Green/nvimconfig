let mapleader = "\<Space>"

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim'
Plug 'phanviet/vim-monokai-pro'
Plug 'tpope/vim-vinegar'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'APZelos/blamer.nvim'
Plug 'softoika/ngswitcher.vim'
Plug 'mattn/emmet-vim'
"Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'yggdroot/indentline'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-signify'
Plug 'herringtondarkholme/yats.vim'
Plug 'elzr/vim-json'
" Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'sirver/ultisnips'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

set title titlestring=%(%{expand(\"%:~:.:h\")}%)/%t\ -\ Vim

set termguicolors
colorscheme monokai_pro

" tree-view
let g:netrw_liststyle = 3

" let g:netrw_winsize = 33

" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'

" use the previous window to open file
let g:netrw_browse_split = 4

filetype plugin on

" search smartcase
set ignorecase
set smartcase
" continue search from the top
set wrapscan

" set tab spaces
set smarttab
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=0 
set expandtab


set encoding=UTF-8

set number
" set relativenumber
set updatetime=100

set mouse=a

"Ultisnip cofiguration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

set cursorline

set wildmenu
set wildmode=full
"Git Blamer Config
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0

" Indent Guides config
" let g:vim_json_syntax_conceal = 2
let g:indentLine_char= "│"
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1

" autocmd Filetype json
"   \ let g:indentLine_setConceal = 0 |
"   \ let g:vim_json_syntax_conceal = 0

" set list
" set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
" let g:indent_guides_start_level=2
" let g:indent_guides_guide_size=1
" let g:indent_guides_enable_on_vim_startup = 1
" set list

" let g:NERDTreeGitStatusUseNerdFonts = 1


" Zoom / Restore window.
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-w>z :ZoomToggle<CR>



nnoremap <silent> <leader>u :<C-u>NgSwitchTS<CR>
nnoremap <silent> <leader>i :<C-u>NgSwitchHTML<CR>
nnoremap <silent> <leader>o :<C-u>NgSwitchCSS<CR>
nnoremap <silent> <leader>p :<C-u>NgSwitchSpec<CR>

"
" commentary
autocmd FileType typescript setlocal commentstring=//\ %s



let g:lightline = {
      \ 'colorscheme': 'monokai_pro',
      \ }





let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-eslint', 
  \ 'coc-tsserver',
  \ 'coc-emmet',
  \ 'coc-cssmodules',
  \ 'coc-vetur',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-angular',
  \ 'coc-json', 
  \ ]
" Use persistent history.
if !isdirectory("/home/shaw/.config/nvim/undo-dir")
    call mkdir("/home/shaw/.config/nvim/undo-dir", "", 0700)
endif
set undodir=/home/shaw/.config/nvim/undo-dir
set undofile

" map space to leader key

" noremap <silent><leader>t :NERDTreeToggle<CR>
noremap <silent><leader>t :Lexplore<CR>
noremap <silent><C-p> :FZF<CR>
noremap <silent><leader><space> :FZF<CR>

let g:fzf_preview_window = 'right:60%'


" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')


"NERD tree 
" let g:NERDTreeIgnore = ['^node_modules$']

"""COC configuration

""""
"""" COC default config
"""" 

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>

" Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>














