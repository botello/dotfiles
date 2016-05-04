" verilog_snippet.vim
	if exists(':StringAbbrLocal') != 2
	  finish
	endif
	StringAbbrLocal while() "while([~cond~]) {\n[~body~]\n}"
   StringAbbrLocal bend "begin\n   [~body~]\nend"
	" ...
