let mapleader=" "

syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set completeopt=noinsert
set smartindent
set backspace=indent,eol,start
set nocompatible
set number
set cursorline
set wrap
set showcmd
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
au Filetype cpp inoremap { {<CR>}<ESC>i
inoremap { {}<ESC>i
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map s :<nop><CR>
map sd : set splitright<CR>:vsplit<CR>
map sa : set nosplitright<CR>:vsplit<CR>
map f w 
map <LEADER><RIGHT> <C-w>l
map <LEADER><LEFT> <C-w>h
map == $
map -- 0
map O :vertical resize-5<CR>
map P :vertical resize+5<CR>

map tu :tabe<CR>
map tn :-tabnext<CR>
map tb :+tabnext<CR>

call plug#begin('~/.vim/plugged')
Plug 'Chiel92/vim-autoformat'
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdtree'
Plug 'kien/rainbow_parentheses.vim'
Plug 'davidhalter/jedi-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'godlygeek/tabular' 
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'mzlogin/vim-markdown-toc'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

let g:SnazzyTransparent = 0.5
color snazzy

let g:python3_host_prog = '/usr/local/bin/'

let python_highlight_all=1
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=79
au Filetype python set expandtab
au Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99

nnoremap <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python3 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
        endif
endfunc

nnoremap <F6> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:autoformat_verbosemode = 1

let g:rbpt_colorpairs = [
                        \ ['brown',       'RoyalBlue3'],
                        \ ['Darkblue',    'SeaGreen3'],
                        \ ['darkgray',    'DarkOrchid3'],
                        \ ['darkgreen',   'firebrick3'],
                        \ ['darkcyan',    'RoyalBlue3'],
                        \ ['darkred',     'SeaGreen3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
                        \ ['brown',       'firebrick3'],
                        \ ['gray',        'RoyalBlue3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
                        \ ['Darkblue',    'firebrick3'],
                        \ ['darkgreen',   'RoyalBlue3'],
                        \ ['darkcyan',    'SeaGreen3'],
                        \ ['darkred',     'DarkOrchid3'],
                        \ ['red',         'firebrick3'],
                        \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
" YouCompleteMe
" 开启自动语义补全
let g:ycm_semantic_triggers =  {
\ 'c,cpp,java,go,erlang,perl': ['re!\w{2}'],
\ 'cs,lua,javascript': ['re!\w{2}'],
\ }
" 更改补全面板的颜色
highlight PMenu ctermfg=0 ctermbg=255 guifg=black guibg=Grey93
highlight PMenuSel ctermfg=255 ctermbg=0 guifg=Grey93 guibg=black
" 禁止自动弹出函数原型窗口
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_key_list_stop_completion = ['<CR>']
" 设置白名单，禁止名单以外的文件格式使用
let g:ycm_filetype_whitelist = {
\ "c":1,
\ "cpp":1,
\ "objc":1,
\ "sh":1,
\ "zsh":1,
\ "zimbu":1,
\ }
" Plug - markdown-preview
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command ckkfan be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
" plug - ultisnips
"设置tab键为触发键
let g:UltiSnipsExpandTrigger = '<c-j>'
"设置向后跳转键
let g:UltiSnipsJumpForwardTrigger = '<c-k>'
"设置向前跳转键
let g:UltiSnipsJumpBackwardTrigger = '<c-h>'
"设置打开配置文件时为垂直打开
let g:UltiSnipsEditSplit="vertical"

function! RangeChooser()
	let temp = tempname()
	if has("gui_running")
		exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
	else
		exec 'silent !ranger --choosefiles=' . shellescape(temp)
	endif
	if !filereadable(temp)
		redraw!
		return
	endif
	let names = readfile(temp)
	if empty(names)
		redraw!
		return
	endif
	exec 'edit ' . fnameescape(names[0])
	for name in names[1:]
		exec 'argadd ' . fnameescape(name)
	endfor
	redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>r :<c-u>RangerChooser<CR>
			
