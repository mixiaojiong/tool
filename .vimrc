let mapleader = ','
" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
	source ~/.vimrc.bundles
endif

call vundle#end()

" 文件
filetype on
filetype indent on                  " 针对不同的文件类型采用不同的缩进格式
filetype plugin on                  " 允许插件
filetype plugin indent on           " 启动自动补全
set encoding=utf-8                  " 设置编码自动识别, 中文引号显示
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" 外观
set background=dark                 " 主题背景
colorscheme solarized               " 颜色主题
syntax on                           " 语法高亮
set laststatus=2
set showcmd                         " 显示命令
set scrolloff=10                    " 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set number                          " 显示行号
set ruler                           " 打开状态栏标尺
set cursorline                      " 突出显示当前行
set showmatch                      " 高亮显示匹配的括号
set matchtime=3                    " 匹配括号高亮的时间(单位：0.1s
set scrolloff=10                    " 光标到屏幕底端保留 10 行 (光标位于屏底看着非常不舒服的)
set ruler                           " 显示右下角提示栏
set showmode                        " 显示左下角状态栏
set listchars=tab:▸\ ,trail:▫
set wildmenu                        " 使用菜单形式展示列表
set wildmode=longest,list,full
" 基本配置
set autoread                        " 自动加载文件变化
set wrap                            " 设定折行
set textwidth=78                    " N个字符折行
set history=1000                    " 历史记录1000
set nocompatible                    " 禁用VI相关
set backspace=indent,eol,start      " 启用backspace删除
set clipboard+=unnamed              " 共享剪切板
set showcmd                         " 输入的命令显示出来
set iskeyword+=_,$,@,%,#,-          " 带有例如以下符号的单词不要被换行切割
"set mouse=a                         " 鼠标可用
set confirm                         " 未保存或者仅仅读时，弹出确认
set nobackup                        " 不生成备份文件
set noswapfile                      " 不生成 swap 文件
set bufhidden=hide                  " 当 buffer 被丢弃的时候隐藏
set noerrorbells                    " 不发出警告声
" 搜索
set ignorecase smartcase            " 搜索忽略大写和小写，但有大写字母时仍保持大写和小写敏感
set hlsearch                        " 高亮搜索
set incsearch                       " 增量式搜索,逐字符高亮

" 对齐
set autoindent                      " 继承前一行的缩进方式。特别适用于多行凝视
set smartindent                     " 智能折叠
set smarttab                        " 开启新行时使用智能 tab 缩进
set expandtab                       " 空格取代Tab
set tabstop=4                       " Tab 键的宽度
set shiftwidth=4                    " 行交错宽度
set softtabstop=4                   " 敲入tab键时实际占有的列数

" 自动
autocmd! bufwritepost .vimrc source %
autocmd BufNewFile *.sh,*.py,*php exec ":call AutoSetFileHead()"
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" 修改默认键
" 同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
" F2 注释
map <F2>a :DoxAuthor<CR>
map <F2>f :Dox<CR>
map <F2>b :DoxBlock<CR>
map <F2>c O/** */<Left><Left><CR>
" 常用分屏
map <silent> <F3> <Esc>:He<cr>
map <silent> <F4> <Esc>:Ve<cr>
map <silent> <F5> <Esc>:Te<cr>
" F6 换行开关
nnoremap <F6> :set wrap! wrap?<CR>
" F7 复制粘贴网页代码前开启
set pastetoggle=<F7>
" F8 显示可打印字符开关
nnoremap <F8> :set list! list?<CR>
" F8 显示行号
nnoremap <F9> :set nu! nu?<CR>
" 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" 行首，行尾
noremap H ^
noremap L $
" 快速输入命令
nnoremap ; :
" 快速搜索
map <space> /
" 快速切换tabe
map <leader>gp gT
map <leader>gn gt
" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
"==========================================
" FileType Settings  文件类型设置
"==========================================

" 具体编辑文件类型的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=4 shiftwidth=4 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html
au BufEnter ~/code/letv/sso/* setlocal tags+=~/code/letv/sso/tags

" 自定义函数 {
    " 定义函数AutoSetFileHead，自动插入文件头
    function! AutoSetFileHead()
        "如果文件类型为.sh文件
        if &filetype == 'sh'
            call setline(1, "\#!/bin/bash")
        endif

        "如果文件类型为python
        if &filetype == 'python'
            call setline(1, "\#!/usr/bin/env python")
            call append(1, "\# encoding: utf-8")
        endif

        "如果文件类型为.php文件
        if &filetype == 'php'
            call setline(1, "<?php")
        endif

        normal G
        normal o
        normal o
    endfunc

    " 保存文件时删除多余空格
    fun! <SID>StripTrailingWhitespaces()
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        call cursor(l, c)
    endfun
" }
