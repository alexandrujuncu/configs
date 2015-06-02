" alexj's vimrc

" My preferences
syntax on	"syntax highlighing
set number	"line numbers
set mouse-=a	"disable mouse editing
set backspace=2	"fix backspace problems
set hlsearch	"search highlighting
set noswapfile	"no swap file... duhhh

" Shortcuts
nmap ,t <Esc>:tabnew<CR>
nmap ,e <Esc>:tabnew<CR>:e



"Ripped off from  ddvlad:

"mark tabs and trailing spaces
set list listchars=tab:»\ ,trail:·,extends:»,precedes:«

" More tabs -- we have enough memory.
set tabpagemax=20



" Ripped off from Alexandru Mosoi (via ddvlad)
set statusline=%<%f\ %y%h%m%r%=%-24.(0x%02B,%l/%L,%c%V%)\ %P
set laststatus=2
set wildmenu



" Ripped off from Cosmin Ratiu, on SO list; 30 Jun 2009 (via ddvlad)
if has("cscope")
" Look for a 'cscope.out' file starting from the current directory,
	" going up to the root directory.
	let s:dirs = split(getcwd(), "/")
	while s:dirs != []
		let s:path = "/" . join(s:dirs, "/")
		if (filereadable(s:path . "/cscope.out"))
			execute "cs add " . s:path . "/cscope.out " . s:path . " -v"
			break
		endif
		let s:dirs = s:dirs[:-2]
	endwhile

	set csto=0	" Use cscope first, then ctags
	set cst		" Only search cscope
	set csverb	" Make cs verbose

	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

	nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

	" Open a quickfix window for the following queries.
	set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
endif
