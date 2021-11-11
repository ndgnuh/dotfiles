" 
" Save the current engine and switch to English IM
"
function! IBusOff()
    "
    " Save the current ibus engine
    "
    let g:ibus_previous_engine = system('ibus engine')
    " 
    " Switch to the english input method
    " which has no pre-edit
    "
    silent! execute '!ibus engine xkb:us::eng'
endfunction

"
" Switch back to the previous ibus engine
"
function! IBusOn()
    "
    " If the engine is not English then use that engine
    "
    let l:current_engine = system('ibus engine')
    if l:current_engine !~? 'xkb:us::eng'
        let g:ibus_previous_engine = l:current_engine
    endif
    "
    " else, restore the previous engine
    "
    silent! execute '!ibus engine ' . g:ibus_previous_engine
endfunction

"
" Auto turn ibus on when in
" - insert mode
" - search mode
" - command mode
"
" Auto turn ibus off when enter
" - normal mode
" - visual mode
"
augroup ibus
    "
    " Search mode
    "
    autocmd CmdLineEnter [/?] silent call IBusOn()
    autocmd CmdLineLeave [/?] silent call IBusOff()
    autocmd CmdLineEnter \? silent call IBusOn()
    autocmd CmdLineLeave \? silent call IBusOff()
    "
    " Command mode
    "
    autocmd CmdLineEnter : silent call IBusOn()
    autocmd CmdLineLeave : silent call IBusOff()
    "
    " Insert mode
    "
    autocmd InsertEnter * silent call IBusOn()
    " 
    " Normal mode
    "
    autocmd InsertLeave * silent call IBusOff()
    " 
    " Since there's no way to go directly
    " (not that I know of) to switch from
    " insert mode to visual mode,
    " there is no need for a visual hook
    "
augroup end
