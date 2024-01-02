set number relativenumber
set hlsearch
set incsearch

set list
set listchars=tab:<->,lead:~,trail:-,nbsp:_,multispace:.

let c_space_errors=1
let c_no_trail_space_error=1
let c_no_tab_space_error=1
let java_space_errors=1

autocmd ColorScheme * hi ExtraWhitespace
	\ term=bold
	\ cterm=bold,underline
	\ gui=bold,underline
	\ ctermbg=red
	\ ctermfg=white
	\ guibg=#FF0000
	\ guifg=#FFFFFF

hi ExtraWhitespace
	\ term=bold
	\ cterm=bold,underline
	\ gui=bold,underline
	\ ctermbg=red
	\ ctermfg=white
	\ guibg=#FF0000
	\ guifg=#FFFFFF

match ExtraWhitespace /\s\+$/

autocmd InsertEnter * match ExtraWhitespace /\s\+$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

autocmd BufWinLeave alpha hi ExtraWhitespace
	\ term=bold
	\ cterm=bold,underline
	\ gui=bold,underline
	\ ctermbg=red
	\ ctermfg=white
	\ guibg=#FF0000
	\ guifg=#FFFFFF

autocmd FileType alpha hi clear ExtraWhitespace
autocmd BufEnter alpha hi clear ExtraWhitespace

