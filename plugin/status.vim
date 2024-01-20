let s:micro_window = 45
let s:small_window = 60
let s:medium_window = 90
let s:large_window = 120

function StartsWith(longer, shorter)
	return a:longer[0:len(a:shorter) - 1] ==# a:shorter
endfunction

function Substring(str, a, b)
	return a:str[byteidx(a:str, a:a):byteidx(a:str, a:b+1) - 1]
endfunction

function IndentStatus()
	let spaces_label = "SPCS: "
	let soft_label = "SOFT: "
	let tabs_label = "TABS: "

	let window_width = winwidth(0)

	if window_width < s:micro_window
		return ""
	elseif window_width < s:small_window
		let spaces_label = "S: "
		let soft_label = "S-T: "
		let tabs_label = "T: "
	endif

	let indent_char_msg = ""

	let shiftwidth_value = (&shiftwidth != 0 ? &shiftwidth : &tabstop)
	let shiftwidth_msg = ""

	if shiftwidth_value != &tabstop
		let shiftwidth_msg = " >> " . shiftwidth_value
	endif

	if &expandtab
		let indent_char_msg = spaces_label . &tabstop

	elseif &softtabstop != 0 && !(&softtabstop < 0 && (&shiftwidth == 0 || &shiftwidth == &tabstop))
		let softtabstop_value = (&softtabstop > 0 ? &softtabstop : shiftwidth_value)
		let indent_char_msg = soft_label . &tabstop . "/" . softtabstop_value
	else
		let indent_char_msg = tabs_label . &tabstop
	endif

	return indent_char_msg . shiftwidth_msg
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

function ModeInvHl()
	let mode_hl = ModeHl()

	let mode_inv_hl = substitute(mode_hl, "Mode", "ModeInv", "")

	return mode_inv_hl
endfunction

function ModeStatus()
	let modename = GetModeName()
	let mode_hl = ModeHl()

	let window_width = winwidth(0)

	if window_width < s:medium_window
		let modename = Substring(modename, 0, 0)
	endif

	return mode_hl . '  ' . modename . ' %#StatusLine#'
endfunction

function TreesitterStatus()
	let window_width = winwidth(0)

	if window_width < s:small_window
		return ""
	endif

	let treesitter_available = get(b:, 'treesitter_available', "v:nil")

	if treesitter_available == "v:true"
		return "TS"
	endif

	return ""
endfunction

function LspStatus()
	let window_width = winwidth(0)

	if window_width < s:small_window
		return ""
	endif

	let lsp_attached = get(b:, 'lsp_attached', "v:nil")

	if lsp_attached == "v:true"
		return "LSP"
	endif

	return ""
endfunction

function FileFormatStatus()
	let fileencoding_value = (&fileencoding == 'utf-8' ? '' : &fileencoding)
	let fileformat_value = (&fileformat == 'unix' ? '' : &fileformat)
	let endoffile_value = (&endoffile == 'noendoffile' ? '' : &endoffile)

	let result = ""

	if fileencoding_value != ""
		let result = result . fileencoding_value
	endif

	if fileformat_value != ""
		if result != ""
			let result = result . " "
		endif

		let result = result . fileformat_value
	endif

	if endoffile_value != ""
		if result != ""
			let result = result . " "
		endif

		let result = result . endoffile_value
	endif

	return result
endfunction

function FileNameStatus()
	if tolower(&filetype) == "alpha"
		return ""
	endif

	let window_width = winwidth(0)

	" Expand full path, using tilda
	let filename = expand("%:~")

	if window_width < s:small_window
		" Only tail
		let filename = expand("%:t")
	elseif window_width < s:medium_window
		" Same, but shorten path
		let filename = expand("%:~:.")
		let filename = pathshorten(filename)
	endif

	return filename . " [%#Modified#%M%#StatusLine#%R%H]"
endfunction

function FileTypeStatus()
	let window_width = winwidth(0)

	if window_width < s:micro_window
		return ""
	endif

	let filetype_value = strlen(&filetype) ? toupper(&filetype) : 'UNKNOWN'

	let filetype_status_value = "%#FileTypeStatus#" . filetype_value " . "%#StatusLine#"
	let filetype_surrounded = "%#FileTypeStatusInv#" . "" . filetype_status_value . "%#FileTypeStatusInv#" . ""

	return filetype_surrounded . "%#StatusLine#"
endfunction

function LocationStatus()
	let window_width = winwidth(0)

	let result = "C:%c/%{&textwidth} L:%l/%L %P"

	if window_width < s:medium_window
		let result = "%P"
	elseif window_width < s:large_window
		let result = "L:%l/%L %P"
	endif

	return " " . result . " "
endfunction


set laststatus=2
set statusline+=%{%ModeStatus()%}%{%ModeInvHl()%}%#StatusLine#
set statusline+=\ %{%FileNameStatus()%}
set statusline+=%<
set statusline+=\ %=%S
set statusline+=\ %=%{FileFormatStatus()}
set statusline+=\ %{%FileTypeStatus()%}
set statusline+=\ %{TreesitterStatus()}
set statusline+=\ %{LspStatus()}%=
set statusline+=\ %{IndentStatus()}
set statusline+=\ %{%ModeInvHl()%}%{%ModeHl()%}%{%LocationStatus()%}

hi FileTypeStatus ctermfg=magenta ctermbg=black
hi FileTypeStatusInv ctermfg=black
hi Modified term=bold cterm=bold gui=bold ctermbg=red ctermfg=white guifg=#FFFFFF guibg=#FF0000
