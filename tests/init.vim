try
	call plug#begin()
	Plug expand('<sfile>')[0:-16] 
	call plug#end()

	lua require("suazppuccin").setup {}
	colorscheme suazppuccin
catch
	echo v:exception
	1cq
finally
	0cq
endtry
