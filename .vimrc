set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileformat=unix
set ambiwidth=double
set smartindent  
set smarttab  
set expandtab  
set tabstop=4  
set softtabstop=4  
set shiftwidth=4  
set backspace=2
set textwidth=81
set nu 
set mouse=
set hls
syntax on
:autocmd FileType python set omnifunc=pythoncomplete#Complete 
let g:pydiction_location='~/.vim/complete-dict'

function MyTitleInsert()
    call setline(1,"#!/usr/bin/env python")
    call append(1,"# -*- coding: utf-8 -*-")
    call append(2,"################################################################################")
    call append(3,"#")
    call append(4,"# Copyright (c) 2015 .com, Inc. All Rights Reserved")
    call append(5,"#")
    call append(6,"################################################################################")
    call append(7,'"""')
    call append(8,"description: ")
    call append(9,"author: liufengxu")
    call append(10,"date: " . strftime("%Y-%m-%d %H:%M:%S"))
    call append(11,"last modified: " . strftime("%Y-%m-%d %H:%M:%S"))
    call append(12,"version: ")
    call append(13,'"""')
    call append(14,'')
    call append(15,'import logging')
    call append(16,'')
    call append(17,'')
    call append(18,"def main():")
    call append(19,'    logging.basicConfig(level=logging.INFO, format="%(levelname)s: "')
    call append(20,'                        "%(asctime)s: %(filename)s: %(lineno)d * "')
    call append(21,'                        "%(thread)d %(message)s",')
    call append(22,'                        datefmt="%Y-%m-%d %H:%M:%S")')
    call append(23,'')
    call append(24,"if __name__ == '__main__':")
    call append(25,'    main()')
endfunction

:autocmd BufNewFile *.py :call MyTitleInsert()

function DateInsert()
call cursor(11,1)
if search('last modified') != 0
let line = line('.')
call setline(line,"last modified: " . strftime("%Y-%m-%d %H:%M:%S"))
endif
endfunction

:autocmd FileWritePre,BufWritePre *.py :call DateInsert()
set nocompatible               " be iMproved
filetype off                   " required!       /**  从这行开始，vimrc配置 **/

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:  /* 插件配置格式 */
"   
" original repos on github （Github网站上非vim-scripts仓库的插件，按下面格式填写）
" solarized 颜色
Bundle 'altercation/vim-colors-solarized'
" 便捷搜索文件
Bundle 'ctrlpvim/ctrlp.vim'
" git工具
Bundle 'tpope/vim-fugitive'
" 多光标
Bundle 'terryma/vim-multiple-cursors'
" taglist 升级版，依赖 ctags，需要安装
Bundle 'majutsushi/tagbar'
" python 折叠，补全，检查，运行等
Bundle 'klen/python-mode'
"" vim-scripts repos  （vim-scripts仓库里的，按下面格式填写）
" python 自动补全词典
Bundle 'Pydiction'
" 自动关闭括号
Bundle 'AutoClose'
" 快速注释
Bundle 'The-NERD-Commenter'
" non github repos   (非上面两种情况的，按下面格式填写)
" 目录文件访问
Bundle 'git clone https://github.com/scrooloose/nerdtree.git'
" ... 

filetype plugin indent on     " required!   /** vimrc文件配置结束 **/
"                                           /** vundle命令 **/
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo 
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"   
" see :h vundle for more details or wiki for FAQ 
" NOTE: comments after Bundle command are not allowed..

" python 补全字典
let g:pydiction_location = '/Users/baidu/.vim/bundle/Pydiction/complete-dict'
" solarized 设置
set t_Co=256                " Explicitly tell vim that the terminal supports 256 colors, need before setting the colorscheme  
let g:solarized_termcolors=256  
set background=dark
colorscheme solarized
" 缩进格式
set foldmethod=indent
" 右下角显示行列数
set ruler
" 永久可回退, 默认存放在.vimundo 路径下
set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
