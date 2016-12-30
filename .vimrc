"#######################
"# General Vim Options #
"#######################
" Use pathogen.
execute pathogen#infect()

" Re-map leader.
let mapleader = ","

" Disable compatibility mode; we actually use vim and not vi.
set nocompatible

" Most of my terminals use a light background.
set background=light

" Enable filetype plugin.
filetype plugin indent on
set grepprg=grep\ -nH\ $*
" Enable syntax option.
syntax on

" Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

" Avoid superfluous redraws.
set lazyredraw

" Set some options for sessions.
set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos

" Set color scheme
set t_Co=256
colorscheme vividchalk
"colorscheme desert256
set guifont=Monospace\ 18

" Enable folding.
set foldmethod=syntax

" Turn off spell check by default but set english as default language.
set nospell 
set spelllang=de,en

" Settings for 'tabbing'
set tabstop=4
set shiftwidth=4
set expandtab

" Settings for indentation
set smartindent
" Shortcut to auto indent entire file
nmap <F11> 1G=G
imap <F11> <ESC>1G=Ga

" Unicode ftw!
set encoding=utf-8

" We do not want to save a buffer whenever we switch buffers.
set hidden
" When we switch buffers we want to keep the cursor position as is.
set nostartofline

" Show date and time in status line.
set statusline=\ %<\ %=%30(%{strftime('%a\ %b\ %e\ %H:%M')}%5l,%-5(%c%V%)%P%)
set laststatus=2
"set statusline=!buftabs#statusline()\ %<\ %=%30(%{strftime('%a\ %b\ %e\ %H:%M')}%5l,%-5(%c%V%)%P%)
"set rulerformat=buftabs#statusline()%30(%{strftime('%a\ %b\ %e\ %H:%M')}%5l,%-5(%c%V%)%P%)

" Shortcuts for copying and pasting to/from the X clipboard
" Only copy the actual selection via xclip. What it does is actually yank
" and then copy the thing yanked last via xclip.
map \yy y :call system('xclip', @0)<CR>
" The following would copy the selected lines via xclip.
"map Y :w !xclip<CR><CR>
" Paste from the X clipboard.
map \pp :r !xclip -o<CR>

" Navigate more easily through long lines that are broken by vi to fit on the screen.
map j gj
map k gk
map <Down> gj
map <Up> gk
imap <Down> <ESC>gja
imap <Up> <ESC>gka

" Put pastetoggle on another key combination.
" This is a convenient way to switch between paste <-> nopaste in insert mode.
set pastetoggle=<C-Insert>

" Have 5 lines of offset (or buffer) when scrolling
set scrolloff=5

" Wildmenu
set wildchar=<Tab> wildmenu wildmode=full

" Shortcuts for buffers
" Switching buffers
map <S-A-C-Left> :bprevious<CR>
map <S-A-C-Right> :bnext<CR>
imap <S-A-C-Left> <ESC>:bprevious<CR>a
imap <S-A-C-Right> <ESC>:bnext<CR>a
" New / Close buffers
map <S-A-C-Up> :n 
map <S-A-C-Down> :bdelete<CR>
imap <S-A-C-Up> <ESC>:n 
imap <S-A-C-Down> <ESC>:bdelete<CR>a

" Shortcuts for windows
" Switching windows
map <S-Left> <C-w><Left>
map <S-Right> <C-w><Right>
imap <S-Left> <ESC><C-w><Left>
imap <S-Right> <ESC><C-w><Right>
map <S-Up> <C-w><Up>
map <S-Down> <C-w><Down>
imap <S-Up> <ESC><C-w><Up>
imap <S-Down> <ESC><C-w><Down>
" Resizing windows
map <C-A-Left> <C-w>3<
map <C-A-Right> <C-w>3>
imap <C-A-Left> <ESC><C-w>3<a
imap <C-A-Right> <ESC><C-w>3>a
map <C-A-Up> <C-w>2+
map <C-A-Down> <C-w>2-
imap <C-A-Up> <ESC><C-w>2+a
imap <C-A-Down> <ESC><C-w>2-a
" Splitting and closing windows
map <S-A-Up> :vsplit<CR>
map <S-A-Right> :split<CR>
map <S-A-Down> :close<CR>
imap <S-A-Up> <ESC>:vsplit<CR>a
imap <S-A-Right> <ESC>:split<CR>a
imap <S-A-Down> <ESC>:close<CR>i

" Shortcuts for tabs
" Switching tabs
map <C-Left> gT
map <C-Right> gt
imap <C-Left> <ESC>gTi
imap <C-Right> <ESC>gti
" New / Close tab
map <C-Up> :tab split<CR>
map <C-Down> :tabclose<CR>
imap <C-Up> <ESC>:tab split<CR>i
imap <C-Down> <ESC>:tabclose<CR>i

" Eclipse-like completion
imap <C-Space> <C-n>
imap <C-S-Space> <C-p>
" Additional completion binding
imap <A-,> <C-n>
imap <A-.> <C-p>
imap <A-Up> <C-n>
imap <A-Down> <C-p>


" Word-wise delete
map <A-BS> i<C-W><ESC>
imap <A-BS> <C-W>
" Word-wise move
map <A-Left> b
imap <A-Left> <ESC>bi
map <A-Right> w
imap <A-Right> <ESC>wwi
" Paragraph-wise move
map <A-Up> {
imap <A-Up> <ESC>{i
map <A-Down> }
imap <A-Down> <ESC>}i

" These characters belong to words. Mostly used for autocompletion.
set iskeyword+=:
set iskeyword+=-

" Some obsolete settings
"
" Force instantaneous tag list update when cursor is moved.
" See also:
" http://stackoverflow.com/questions/4568813/vim-taglist-plugin-slow-update
" autocmd CursorMoved,CursorMovedI * silent! TlistHighlightTag
"
" Disable parentheses matching plugin as this slows some things down.
let g:loaded_matchparen = 1
"
" Using a mouse is handy, even in an terminal.
" This offers more flexibility on interacting with vim.
"set mouse=a

"####################
"# Options for Gvim #
"####################
if has("gui_running")
" Disable menu, toolbar, and scrollbars (left and right) in gvim.
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guioptions-=b
endif

"#################################
"# Options for Specific Plug-ins #
"#################################

" Taglist plug-in - http://www.vim.org/scripts/script.php?script_id=273
let Tlist_WinWidth = 35
let Tlist_Compact_Format = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_GainFocus_On_ToggleOpen = 1
"map <C-PAGEUP> :TlistOpen<CR>
map <C-PAGEDOWN> :TlistToggle<CR>
"imap <C-PAGEUP> <ESC>:TlistOpen<CR>
imap <C-PAGEDOWN> <ESC>:TlistToggle<CR>i

" :Explore
let g:netrw_altv=1
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_winsize=20
map <C-End> :Sexplore!<CR>
imap <C-End> <ESC>:Sexplore!<CR>i
" let g:netrw_list_hide= netrw_gitignore#Hide().'.*\.swp$'
let g:netrw_list_hide='\.aux$,\.bbl$,\.blg$,\.idx$,\.ilg$,\.ind$,\.lof$,\.log$,\.lol$,\.lot$,\.nlo$,\.nls$,\.out$,\.pdf$,.*\.swo$,.*\.swp$,\.toc$,\.o$' 
"map <C-b> :Bookmark 
"let NERDTreeIgnore=['\.aux$', '\.bbl$', '\.blg$', '\.idx$', '\.ilg$', '\.ind$', '\.lof$', '\.log$', '\.lol$', '\.lot$', '\.nlo$', '\.nls$', '\.out$', '\.pdf$', '\.toc$', '\.o$'] 

" ConqueShell plug-in - https://github.com/vim-scripts/Conque-Shell http://www.vim.org/scripts/script.php?script_id=2771
map <C-b> :ConqueTerm bash<CR>
imap <C-b> <ESC>:ConqueTerm bash<CR>

" shell plug-in - https://github.com/xolox/vim-shell
map <C-o> :Open<CR>
imap <C-o> <ESC>:Open<CR>

" vim-latex http://vim-latex.sourceforge.net/ 
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_ps = 'okular'
let g:Tex_ViewRule_pdf = 'okular'
let g:Tex_ViewRule_dvi = 'okular'
" let g:Tex_Leader = "<"
" let g:Tex_Leader2 = "<"
" Editor command to enable inverse search in okular: gvim -c ":RemoteOpen +%l %f"
" Note: Use <shift>+<left_mouse_click> for inverse search. For forward search use \ls.
" https://www.math.tu-berlin.de/fileadmin/i26/download/AG_ModNumDiff/FG_NumMath/seminars/toolseminar/ts5invSear.pdf
" let g:Tex_Debug=1
" Show debug output with: :call Tex_PrintDebug()

" Maximize gvim
if has("gui_running")
  set lines=40 columns=120
endif

" Rainbow parentheses:
" https://github.com/luochen1990/rainbow
let g:rainbow_active = 1
autocmd BufReadPost * RainbowToggle

