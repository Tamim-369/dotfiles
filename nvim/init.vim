
" --- PLUGIN MANAGER ---
call plug#begin('~/.vim/plugged')

" Nord theme
Plug 'arcticicestudio/nord-vim'
" Sonokai theme
Plug 'sainnhe/sonokai'
" One dark theme
Plug 'joshdick/onedark.vim'



call plug#end()

" --- GENERAL SETTINGS ---
syntax on
set number
set cursorline
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set termguicolors
set background=dark
set clipboard=unnamedplus

" --- THEME: Syntax colors only + custom statusline bg ---
function! LoadSyntaxOnlyWithStatusline(theme)
  exe 'colorscheme ' . a:theme

  " Clear ALL background/UI highlights (except statusline — we'll set it next)
  highlight Normal        guibg=NONE ctermbg=NONE
  highlight NonText       guibg=NONE ctermbg=NONE
  highlight EndOfBuffer   guibg=NONE ctermbg=NONE
  highlight LineNr        guibg=NONE ctermbg=NONE
  highlight SignColumn    guibg=NONE ctermbg=NONE
  highlight CursorLine    guibg=NONE ctermbg=NONE
  highlight CursorLineNr  guibg=NONE ctermbg=NONE
  highlight VertSplit     guibg=NONE ctermbg=NONE
  highlight TabLine       guibg=NONE ctermbg=NONE
  highlight TabLineFill   guibg=NONE ctermbg=NONE
  highlight TabLineSel    guibg=NONE ctermbg=NONE

  " ✅ SET STATUSLINE BACKGROUND TO #2e3440 (Nord-like dark blue-gray)
  highlight StatusLine    guifg=#D8DEE9 guibg=#2e3440 gui=NONE
  highlight StatusLineNC  guifg=#81A1C1 guibg=#2e3440 gui=NONE
endfunction

" Use your preferred theme
call LoadSyntaxOnlyWithStatusline('sonokai')


