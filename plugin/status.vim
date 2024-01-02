function StartsWith(longer, shorter)
	return a:longer[0:len(a:shorter) - 1] ==# a:shorter
endfunction

function IndentStatus()
	let indent_char_msg = ""
	let shiftwidth_msg = ""

	if &expandtab
		let indent_char_msg = "SPCS: " . &tabstop
	elseif &softtabstop != 0
		let indent_char_msg = "SOFT: " . &tabstop . "/" . (&softtabstop != -1 ? &softtabstop : &shiftwidth)
	else
		let indent_char_msg = "TABS: " . &tabstop
	endif

	let shiftwidth_msg = ">> " . (&shiftwidth != 0 ? &shiftwidth : &tabstop)

	return indent_char_msg . " " . shiftwidth_msg
endfunction

function Capitalize(str)
	return toupper(a:str[0]) . tolower(a:str[1:-1])
endfunction

function GetModeName()
	let m = mode(1)
	let modename = "UNKNOWN"

	if StartsWith(m, "n")
		let modename = "NORMAL"
	elseif StartsWith(m, "c")
		let modename = "COMMAND"
	elseif StartsWith(tolower(m), "v")
		let modename = "VISUAL"
	elseif StartsWith(m, "")
		let modename = "VISUAL"
	elseif StartsWith(tolower(m), "s")
		let modename = "SELECT"
	elseif StartsWith(m, "")
		let modename = "SELECT"
	elseif StartsWith(m, "R")
		let modename = "REPLACE"
	elseif StartsWith(m, "i")
		let modename = "INSERT"
	elseif StartsWith(m, "r")
		let modename = "PROMPT"
	elseif StartsWith(m, "!")
		let modename = "SHELL"
	elseif StartsWith(m, "t")
		let modename = "TERMJOB"
	endif

	return modename
endfunction

function ModeHl()
	let modename = GetModeName()
	let mode_hl_name = Capitalize(modename)

	if modename == "PROMPT"
		let mode_hl_name = "Unknown"
	elseif modename == "SHELL" || modename == "TERMJOB"
		let mode_hl_name = "Command"
	endif

	return '%#Mode' . mode_hl_name . '#'
endfunction

function ModeStatus()
	let modename = GetModeName()
	let mode_hl = ModeHl()

	return mode_hl . ' ' . modename . ' %#StatusLine#'
endfunction

function TreesitterStatus()
	let treesitter_available = get(b:, 'treesitter_available', "v:nil")

	if treesitter_available == "v:true"
		return "TS"
	endif

	return ""
endfunction

function LspStatus()
	let lsp_attached = get(b:, 'lsp_attached', "v:nil")

	if lsp_attached == "v:true"
		return "LSP"
	endif

	return ""
endfunction

set laststatus=2
set statusline+=%{%ModeStatus()%}
set statusline+=\ %f
set statusline+=\ [%#Modified#%M%#StatusLine#%R%H]
set statusline+=\ %<
set statusline+=\ %=%S
set statusline+=\ %=%{&fenc}
set statusline+=\ %{&ff}
set statusline+=\ %#FileTypeStatus#\ %{toupper(strlen(&filetype)?&filetype:'UNKNOWN')}\ %#StatusLine#
set statusline+=\ %{TreesitterStatus()}
set statusline+=\ %{LspStatus()}%=
set statusline+=\ %{IndentStatus()}
set statusline+=\ %{%ModeHl()%}
set statusline+=\ C:%c/%{&textwidth}
set statusline+=\ L:%l/%L
set statusline+=\ %P\ 

hi FileTypeStatus ctermfg=magenta ctermbg=black
hi Modified term=bold cterm=bold gui=bold ctermbg=red ctermfg=white guifg=#FFFFFF guibg=#FF0000
