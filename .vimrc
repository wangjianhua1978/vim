if !isdirectory(&undodir)
  call mkdir(&undodir, 'p', 0700)
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Leader shortcuts {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","  " map leader键设置,若未设置 Leader，建议设置为逗号
let g:mapleader = ","

" 运行模式。
set nocompatible      " 非兼容vi模式，等价于set nocp
set history=500       " history存储长度。
set autoread          " 文件修改之后自动载入。
"set mouse=a          " 在所有的模式下面打开鼠标。
:set mouse=           " =后面不要跟任何值, 可以关闭鼠标模式

" Highlight search results
set hlsearch          " 高亮search命中的文本。
exec "nohlsearch"

" Makes search act like search in modern browsers
set incsearch

" Ignore case when searching
"set ignorecase

" When searching try to be smart about cases
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Package management (vim-plug) and plugins {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" source: https://github.com/junegunn/vim-plug
call plug#begin()
"Plug 'flazz/vim-colorschemes'
Plug 'sainnhe/sonokai'

" rm .vim/plugin/NERD_tree.vim
"Plug 'preservim/nerdtree' |
"            \ Plug 'Xuyuanp/nerdtree-git-plugin' , { 'on':  'NERDTreeToggle' } |
"            \ Plug 'ryanoasis/vim-devicons' , { 'on':  'NERDTreeToggle' }

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

"Plug 'preservim/nerdtree' |
"            \ Plug 'Xuyuanp/nerdtree-git-plugin' , { 'on':  'NERDTreeToggle' }

Plug 'tpope/vim-fugitive'

"Plug 'Yggdroot/indentLine'

" <leader>s to git blame this line
Plug 'zivyangll/git-blame.vim'

" <leader>gb to git blame
Plug 'airblade/vim-gitgutter'

" <leader>cs to comment this line
Plug 'preservim/nerdcommenter'

" Make your Vim/Neovim as smart as VSCode.
" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" https://github.com/marlonfan/coc-phpls
" In your vim/neovim, run command: `:CocInstall coc-phpls` to enable php language server.
" Disable auto pairs: run command: `:ConUninstall coc-pairs`.
" :CocList
" :CocUpdate

" 自动补全括号、引号等
"Plug 'jiangmiao/auto-pairs'

" 彩虹括号增强版 (Rainbow Parentheses Improved)
"Plug 'luochen1990/rainbow'

"Plug 'scrooloose/syntastic'

" https://github.com/ryanoasis/dotfiles/blob/master/.vimrc
" https://raw.githubusercontent.com/wiki/ryanoasis/vim-devicons/samples/v0.7.x/.vimrc-linux-1
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-webdevicons'

" Make the yanked region apparent! 高亮复制的区域
Plug 'machakann/vim-highlightedyank'

" 个人定制
Plug 'itchyny/vim-cursorword'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/vim-easy-align'

" Initialize plugin system
call plug#end()

" required if using https://github.com/bling/vim-airline
let g:airline_powerline_fonts=1

autocmd! bufwritepost _vimrc source % " vimrc文件修改之后自动加载。 windows。
autocmd! bufwritepost .vimrc source % " vimrc文件修改之后自动加载。 linux。
set ru                " 打开vim的状态栏标尺
"set cursorline        " highlight current line
"set showcmd           " show command in bottom bar
set redrawtime=1000  " https://github.com/vim/vim/issues/2790

set list
set listchars=tab:▸\ ,trail:▫  " 显示多余的空格和tab

"" 启用代码折叠
"set foldenable
""set fdm=indent
"set foldmethod=indent
"set foldlevelstart=10   " open most folds by default

" 取消自动备份及产生swp文件
set nobackup          " 取消备份。
set nowb              " set nowritebackup
set noswapfile        " 取消交换文件
set undodir=~/.vim/undodir " 撤销文件保存目录

" 设置编码。
"set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936  " 设置文件的编码。
set fileencodings=utf-8
set fencs=utf8,gbk,gb2312,gb18030
set termencoding=utf-8        " 设置终端的编码
set encoding=utf-8            " 设置vim内部使用的编码，包括buffer、菜单、消息
set helplang=cn               " 设置使用中文的帮助。

" TextEdit might fail if hidden is not set.
set hidden

" 显示设置。
set number                    " 显示行号。
set guifont=Consolas:h11      " window gui模式下面的字体。
set nowrap                    " 取消换行。
" set wrap
" set linebreak
set ambiwidth=double

" set t_Co=8                    " 设定色彩位数。XSehll下只有设定为8位色才能正常使用solarized系列主题。the color, can be 8, 16, 32, 64 256
" https://lujianduan.github.io/2017/02/02/vim-xshell-support-256-color/
" sudo ln -s /lib/terminfo/x/xterm-256color /usr/share/terminfo/x/xterm-256color
" export TERM='xterm-256color'
set t_Co=256                  " the color, can be 8, 16, 32, 64 256

au GUIEnter * simalt ~x       " windows下面打开最大化。
syntax on                     " 打开语法高亮。
"set background=dark           " 设定背景主题
"colorscheme      solarized   " 设定颜色主题
"colorscheme     elflord      " 设定颜色主题, common, frencyly used
"colorscheme     default     " 设定颜色主题
"colorscheme gruvbox
"colorscheme hybrid

" other colorscheme: https://github.com/sainnhe/sonokai
let g:sonokai_style = 'default'
let g:sonokai_enable_italic = 1           " 启用斜体
let g:sonokai_disable_italic_comment = 0  " 在注释中启用斜体
"colorscheme sonokai                       " Plug 'sainnhe/sonokai'
colorscheme jellybeans

au GUIEnter * simalt ~x       " windows下面打开最大化。
let php_folding=0             " 打开自动折叠的功能。
set shortmess=atI             " 不显示援救乌干达儿童的提示

" 自动保留屏幕上的内容。
set t_ti=
set t_te=

" 缩进。
" 当使用 et 将 Tab 替换为空格之后，按下一个 Tab 键就能插入 4 个空格，但要想删除这 4 个空格，就得按 4 下 Backspace，很不方便。设置 smarttab 之后，就可以只按一下 Backspace 就删除 4 个空格了。
set smarttab
set autoindent    " 继承前一行的缩进方式，特别适用于多行注释
" 在命令模式下使用 Tab 自动补全的时候，将补全内容使用一个漂亮的单行菜单形式显示出来。
set wildmenu
set cin
set cino==10    " 设定自动缩进的风格，详见help cino
"filetype indent on

" tab 空格。
set expandtab                 " Tabs are spaces, not tabs
set smarttab
set shiftwidth=4              " 智能Tab设定值为4
autocmd FileType java,php setl shiftwidth=4 "没法很好的检测文件类型（比如html.php，其内的html元素要按html的要求缩进两个空格），仰天长叹，空格数一律设成俩完事= =
autocmd FileType java,php setl tabstop=4
autocmd FileType go setl tabstop=4
autocmd FileType html,vim,javascript,css,js setlocal shiftwidth=2
autocmd FileType html,vim,javascript,css,js setlocal tabstop=2
autocmd FileType make set noexpandtab

" taglist
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动退出vim
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 0
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 35
let tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'


" 自动完成。
autocmd FileType php          setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType html         setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript   setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.conf set filetype=apache
autocmd BufNewFile,BufRead *.vol  set filetype=vo_base
autocmd BufNewFile,BufRead *todo* set filetype=vo_base
autocmd BufNewFile,BufRead *.lst  set filetype=vo_base
autocmd BufNewFile,BufRead *.tree set filetype=vo_base
autocmd BufNewFile,BufRead *.book set filetype=vo_base

" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim

" basic mapping to avoid the problem with fast fingers =P
" 快捷方式
command! W w  " 将W命令等同于w命令，可用于:W等操作。配置的原因是按下冒号键需要按shift，短时间内按WQ键会导致非法操作。
command! Q q  " 将Q命令等同于q命令，可用于:q等操作。配置的原因是按下冒号键需要按shift，短时间内按WQ键会导致非法操作。
command! WQ wq
command! Wq wq
command! Qa qa
command! QA qa

" :W sudo saves the file
" (useful for handling the permission-denied error)
" command! W  execute 'w !sudo tee % > /dev/null' <bar> edit!

" Smart way to move between windows

map <c-f>  <c-x><c-o>
map <C-j> :bn<CR>
map <C-k> :bp<CR>
"map <space> i<space><ESC>
nmap + :vertical resize +10<CR>
nmap - :vertical resize -10<CR>

" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l

" note: not supported in xshell. So comment it out.
"map <C-Tab> :tabn<CR>
"map <S-Tab> :bp<CR>  " S-Tab -> Shift+Tab

" `sudo apt install universal-ctags` or `apt install exuberant-ctags`
map <F9>    :NERDTreeToggle<CR>
map <F10>   :TlistToggle<CR>
map <C-N>   :tabn<CR>
map <C-B>   :tabp<CR>
"set pastetoggle=<F2>
" 停止搜索高亮的键映射
nnoremap <silent> <F2> :nohlsearch<CR>

" 快捷方式
" note: not supported in xshell. So comment it out.
"map <C-Tab> :bnext<CR>
"map <S-Tab> :bp<CR>
"map <C-S>   :w!<CR>            " not compatible with Linux. We can use `stty stop undef` to disable it.
"set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
"" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
"map <C-space> ?



" PHP模板。
autocmd BufNewFile  model.php    0r ~/.vim/template/model.php
autocmd BufNewFile  control.php  0r ~/.vim/template/control.php
autocmd BufNewFile  *.html.php   0r ~/.vim/template/html.php

"加载用户自定义的配置文件。
filetype  on
filetype  plugin    on     "此命令用于加载“filetype plugin on“命令，实际上是执行$vimRUNTIME/ftplugin.vim脚本，有兴趣可以读一下这个脚本。这个脚本中会设置自动命令，在runtimepath中搜索文件类型插件。
"runtimepath的定义在不同的系统上不一样，对UNIX系统来说，这些路径包括：$HOME/.vim、$vim/vimfiles、$vimRUNTIME、$vim/vimfiles/after、$HOME/.vim/after。
"举一个例子，当我们对一个c类型的文件打开”filetype plugin on”时，它会在上述这几个目录的ftplugin子目录中搜索所有名为c.vim、c_*.vim，和c/*.vim的脚本，并执行它们。在搜索时，它按目录在runtimepath中出现的顺序进行搜索。缺省的，它会执行$vimRUNTIME/ftplugin/c.vim，在这个脚本里，会设置c语言的注释格式、智能补全函数等等。
"
"
"然而，在虚拟机中有一个php与html插件，在敲tab时会自动补全所有函数，经常发生误触事件。所以在这里暂时先关闭该选项.
filetype  indent    on

" 添加PHP注释
source ~/.vim/plugin/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

" taglist函数名
let g:snip_set_textmate_cp=1

" 关闭自动添加注释。
autocmd FileType * setl fo-=cro
autocmd FileType php setl fo-=cro

" 保存时自动移除多余的空格
autocmd BufWritePre * %s/\s\+$//e
"设置新的后缀文件高亮
au BufNewFile,BufRead *.wlua set filetype=lua

""""""""""设置开启ctags"""""""""""""
map <F4> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

"第一个命令里的分号是必不可少的。这个命令让vim首先在当前目录里寻找tags文件，如果没有找到
"tags文件，或者没有找到对应的目标，就到父目录 中查找，一直向上递归。因为tags文件中记录的>路径总是相对于tags文件所在的路径，所以要使用第二个设置项来改变vim的当前目录。
"绝对路径
set autochdir
set tags+=./tags,./TAGS,tags;~,TAGS;~"指定tags路径

"折叠模式设为手动折叠
set  foldmethod=manual

"添加标签式浏览功能
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


" 英语拼写检查
set spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline
" Set style for gVim
hi SpellBad gui=undercurl
" 拼写检查只检查英语单词而忽略中文
setlocal spell spelllang=en_us,cjk

" 显示状态栏
set laststatus=2
function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "g")
    return curdir
endfunction
"set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}@%{hostname()}
set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ %=\ %l,%c\ %p%%\ \%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}

" Always show current position
set ruler

set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current


" PHP_noArrowMatching, 取消箭头（->）匹配, https://github.com/2072/PHP-Indenting-for-VIm , :help php-indent
:let g:PHP_noArrowMatching = 1


" https://github.com/preservim/nerdtree/blob/master/doc/NERDTree.txt

" [Option to change the default indent size](https://github.com/preservim/nerdtree/issues/848)
" [Too much whitespace before the icons, only affects this plugin](https://github.com/Xuyuanp/nerdtree-git-plugin/issues/198)
" [Folders and files are badly aligned #248](https://github.com/ryanoasis/vim-devicons/issues/248)
" https://github.com/joshukraine/dotfiles/commit/24bf11106f2654cffdd2d071664a5799b917a02d
" * Also disabling (for now) nerdtree-git-plugin as it contributes to a lot of extra space.
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true

"let g:NERDTreeWinSize=30
let g:NERDTreeWinPos = "left"
"let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly = "RO"

let g:NERDTreeGitStatusShowClean = 0 " default: 0"
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusShowIgnored  = 1 " a heavy feature may cost much more time. default: 0
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'=',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" https://github.com/spf13/spf13-vim/blob/3.0/.vimrc
" Fugitive {
    if isdirectory(expand("~/.vim/plugged/vim-fugitive/"))
        nnoremap <silent> <leader>gs :Git<CR>
        nnoremap <silent> <leader>gd :Git diff<CR>
        nnoremap <silent> <leader>gb :Git blame<CR>
        nnoremap <silent> <leader>gl :Git log<CR>
    endif
"}

let g:rainbow_active = 0 "set to 0 if you want to enable it later via :RainbowToggle


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fixes statusline only appearing in split windows mode
set laststatus=2
" source: https://github.com/Lokaltog/vim-powerline

" dont need showmode indicator now because using awesome Powerline :D
set noshowmode

let g:airline_powerline_fonts = 1
"let g:airline_theme = 'powerlineish'
"let g:airline_theme = 'dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

"let g:airline#extensions#tabline#fnamemod = 'abcd :p'

"let g:airline#extensions#tabline#formatter = 'unique_tail'

" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'
" source: https://github.com/vim-airline/vim-airline/issues/372

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neoclide/coc.nvim {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

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
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

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

" Use <c-space> to trigger completion. This shortcut always be taken to toggle
" Chinese or English by Input Method.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
" see: 'coc.preferences.jumpCommand', set to 'tab drop', 'tabe' or 'edit' is not a good choice.
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
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

" Remap keys for applying codeAction to the current buffer. 查看针对此行的可操作选项
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line. 自动修复当前行的问题
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

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

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

"" Use CTRL-S for selections ranges.  NOT compatible against with Linux, We can use `stty stop undef` to disable it.

"" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

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
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" machakann/vim-highlightedyank {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make the yanked region apparent! 高亮复制的区域
let g:highlightedyank_highlight_duration = -1
highlight HighlightedyankRegion cterm=reverse gui=reverse
if !exists('##TextYankPost')
    nmap y <Plug>(highlightedyank)
    xmap y <Plug>(highlightedyank)
    omap y <Plug>(highlightedyank)
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" zivyangll/git-blame.vim {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" git-blame.vim config
""" n  Normal mode map. Defined using ':nmap' or ':nnoremap'.
""" i  Insert mode map. Defined using ':imap' or ':inoremap'.
""" 把最想要的功能或配置放到底部
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
