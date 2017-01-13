set  nocp						        "do not compatible with vi
"set backspace=2                         "usr arrow key,not A,B,C,D
set autowrite							"auto save file
"set autoindent							"next line auto indent above line
set number							"show line number
set cursorline							"show a underline
"set cursorcolumn
set softtabstop=4						"if use backspace,delete 4 space
set tabstop=4							"if use Tab,add 4 space
set shiftwidth=4
set expandtab							"auto change tab to space
set nobackup							"do not create *~ file
set incsearch							"start search while inputing
set hlsearch							"hight light the search result 
set cmdheight=1							"the height of cmd line is 1
"set laststatus=2						"show status line
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
set cindent							"C indent
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s		"specify category valuy
set showmatch							"show matched '{' or '('
set linebreak							"if too long,show on the next line,but do not break word
set foldenable							"now can use fold
"set foldmethod=manual						"set fold method 
set foldmethod=marker						"set fold method 
set foldcolumn=1
set history=100							"buffer size of history
set showcmd								"show the command
set showmode							"show mode of vim
set textwidth=150
set backspace=indent,eol,start
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\[HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

filetype plugin indent on					"now can use plugin

syntax enable
syntax on
"colorscheme desert

"***********Ctags*******************
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags;
set tags+=./tags;						"add current directory's generated tags file
"set tags+=/home/ml/ltib/rpm/BUILD/linux-3.0.35/tags; 			"add new tags file
"set tags+=/home/ml/work/gstreamer-0.10.36/tags;
"***********End of Ctags************

"***********Color*******************
"***********End of Color************

"***********omnicppcomplete*********
imap <F3> <C-X><C-O>
imap <F2> <C-X><C-I>
set completeopt=menu,menuone 
let OmniCpp_MayCompleteDot = 1			" autocomplete with .
let OmniCpp_MayCompleteArrow = 1	" autocomplete with ->
let OmniCpp_MayCompleteScope = 1	" autocomplete with ::
let OmniCpp_SelectFirstItem = 2		" select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
"let OmniCpp_DefaultNamespaces=["std"]
let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1 
"****end of omnicppcomplete*********

"***********Taglist setting*********
let Tlist_Ctags_Cmd='ctags'	
let Tlist_Use_Right_Window=1		"show windown on the right 
let Tlist_Show_One_File=0			"show many file's taglist
let Tlist_File_Fold_Auto_Close=1	"if the file not editing,fold it
let Tlist_Exit_OnlyWindow=1			"if q:,exit
let Tlist_Process_File_Always=1		"always update
let Tlist_Inc_Winwidth=0
"****end ofTaglist setting*********

"*********** WinManager setting*********
let g:winManagerWindowLayout='FileExplorer|TagList' "which plugin you wanto to manage?
let g:persistentBehaviour=0						"if :qa ,exit
let g:bufExplorerMaxHeight=30
let g:defaultExplorer=0
nmap wm :WMToggle<cr> 
"*****end of WinManager setting*********

"*********** MiniBufferExplorer*********
let g:miniBufExplMapWindowNavVim = 1	"Press Ctrl+h/j/k/l,goto window on the left,down,up,right
let g:miniBufExplMapWindowNavArrows = 1 "Press Ctrl+ direction key ,goto window on the left,down,up,right
let g:miniBufExplModSelTarget = 1		"if the window can not edit,do not open the buffer 
let g:minibufExplSplitBelow=0           "Put new window above current or on the left if vertical split
"let g:miniBufExplorerMoreThanOne=0
"*****end of MiniBufferExplorer*********

"*********** QuickFix setting **********
    map <F12> :make clean<CR><CR><CR>	"Press F6, make clean
    map <F9> :make<CR><CR><CR> :copen<CR><CR>	"Press F7, make ,and open quickfix window,show compaile,link message
    map <F10> :cp<CR>					"Press F8,show previous message
    map <F11> :cn<CR>					"Press F9,show next message
    imap <F12> <ESC>:make clean<CR><CR><CR>
    imap <F9> <ESC>:make<CR><CR><CR> :copen<CR><CR>
    imap <F10> <ESC>:cp<CR>
    imap <F11> <ESC>:cn<CR>
"*****end of QuickFix setting **********

"*********** Cscope setting ************
if has("cscope")
    set csprg=/usr/bin/cscope   "point out cscope's path
    set csto=0                  "set the order: 0,first search cscope database,next tags; 1,first tags,next cscope database
    set cst                     "will use cscope database and tags also
    set cscopequickfix=s-,c-,d-,i-,t-,e-    "show result in quitfix
    set nocsverb
 "   cs add /home/ml/ltib/rpm/BUILD/linux-3.0.35/cscope.out
  "  cs add /home/ml/work/gstreamer-0.10.36/cscope.out
    if filereadable("cscope.out")    "if can find cscope database in current path,add it to vim
            cs add cscope.out
    elseif $CSCOPE_DB != ""            " or if $CSCOPE_DB not a space,add it to vim
            cs add $CSCOPE_DB
    endif
    set csverb
endif
"map <F4> :cs add /home/ml/ltib/rpm/BUILD/linux-3.0.35/cscope.out /home/ml/ltib/rpm/BUILD/linux-3.0.35<CR><CR><CR> :cs reset<CR>
"imap <F4> <ESC>:cs add /home/ml/ltib/rpm/BUILD/linux-3.0.35/cscope.out /home/ml/ltib/rpm/BUILD/linux-3.0.35<CR><CR><CR> :cs reset<CR>
	" make short key Ctrl+Shift+c/s/g/d/t/e/f/i
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>
"*****end of Cscope setting ************

inoremap ( (   )<ESC>hhi
inoremap [ []<ESC>i
inoremap { {<cr>}<ESC>ko<tab>
inoremap <C-o> <ESC>o
inoremap <C-h> <ESC>lhi
inoremap <C-j> <ESC>ji
inoremap <C-k> <ESC>ki
inoremap <C-l> <ESC>lli
inoremap <C-w> <ESC>lwi
inoremap <C-b> <ESC>bi
"inoremap <S-a> <ESC><S-a>
"inoremap <C-h> <Left>                  "Can not use in ubuntu 12.04 
"inoremap <C-j> <Down> 
"inoremap <C-k> <Up> 
"inoremap <C-l> <Right> 
inoremap <ESC> <ESC>l

"****************************************************************************************
"This command: set autochdir Must be after cs add cscope.out!!!!!!!!!!
"set autochdir							"auto change the dir to the editing file's path
"****************************************************************************************
