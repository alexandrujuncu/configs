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


" Add modeline functionality -- it's disabled by default on some distros
set modeline

" Per-filetype settings
autocmd FileType java		setlocal tw=78 cin foldmethod=marker
autocmd FileType c,cpp		setlocal tw=72 cindent noexpandtab
autocmd FileType python		setlocal autoindent expandtab sts=4 sw=4 tw=78
autocmd FileType haskell	setlocal tw=72 sw=2 sts=2 et
autocmd FileType tex		setlocal tw=72 sw=2 sts=2 ai et
" 'linebreak' won't work without 'nolist'
autocmd FileType creole		setlocal tw=0 fo=t wrap nolist linebreak
autocmd FileType mail		setlocal tw=72 fo=tql
autocmd FileType lua		setlocal sts=4 sw=4 ai et
autocmd FileType rust		setlocal cin
autocmd FileType sh		setlocal sts=4 sw=4 si et

filetype plugin on



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

	nmap <C-\>s :tab cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>g :tab cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>c :tab cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>t :tab cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>e :tab cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>f :tab cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-\>i :tab cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\>d :tab cs find d <C-R>=expand("<cword>")<CR><CR>

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
