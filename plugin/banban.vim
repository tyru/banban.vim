" vim:foldmethod=marker:fen:
scriptencoding utf-8

" Check if :winpos works {{{

" NOTE: Delay the a load of this script until VimEnter.
" Because :winpos raised an error on gVim (Windows)
" while loading this script at startup.
augroup banban-winpos-check
    autocmd!
    autocmd VimEnter * let s:delayed = 1 | source <sfile>
augroup END
if !exists('s:delayed')
    finish
endif

" mattn says this plugin work on terminal. really??
try
    silent winpos
catch /^Vim\%((\a\+)\)\=:E188/
    finish
endtry
" }}}

" Load Once {{{
if (exists('g:loaded_banban') && g:loaded_banban) || &cp
    finish
endif
let g:loaded_banban = 1
" }}}
" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}


let s:AA_LIST = [
\   'ﾊﾞﾝ（∩`･ω･）ﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（⊃`･ω･）ﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（∩`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（⊃`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（∩`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（⊃`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（∩`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（⊃`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（∩`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（⊃`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（∩`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（⊃`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（∩`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（⊃`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（∩`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（⊃`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（∩`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（⊃`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（∩`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（⊃`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（∩`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（⊃`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（∩`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\   'ﾊﾞﾝ（⊃`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝ',
\]
let s:context = {}


" for statusline
function! BanbanAA()
    if empty(s:context) | return '' | endif
    return get(s:AA_LIST, s:context.aa_index, s:AA_LIST[0])
endfunction

function! s:update_statusline()
    let s:context.aa_index =
    \   len(s:AA_LIST) > s:context.aa_index + 1 ?
    \       s:context.aa_index + 1 :
    \       0
    redrawstatus
endfunction

" this function is from winmove.vim
function! s:move_to(dest)
    if has('gui_running')
        let winpos = { 'x':getwinposx(), 'y':getwinposy() }
    else
        redir => out | silent! winpos | redir END
        let mpos = matchlist(out, '^[^:]\+: X \(-\?\d\+\), Y \(-\?\d\+\)')
        if len(mpos) == 0 | return | endif
        let winpos = { 'x':mpos[1], 'y':mpos[2] }
    endif
    let repeat = v:count1

    if a:dest == '>'
        let winpos['x'] = winpos['x'] + s:context.dx * repeat
    elseif a:dest == '<'
        let winpos['x'] = winpos['x'] - s:context.dx * repeat
    elseif a:dest == '^'
        let winpos['y'] = has("gui_macvim") ?
              \ winpos['y'] + s:context.dy * repeat :
              \ winpos['y'] - s:context.dy * repeat
    elseif a:dest == 'v'
        let winpos['y'] = has("gui_macvim") ?
              \ winpos['y'] - s:context.dy * repeat :
              \ winpos['y'] + s:context.dy * repeat
    endif
    if winpos['x'] < 0 | let winpos['x'] = 0 | endif
    if winpos['y'] < 0 | let winpos['y'] = 0 | endif

    execute 'winpos' winpos['x'] winpos['y']
endfunction

function! s:rand(n)
    let match_end = matchend(reltimestr(reltime()), '\d\+\.') + 1
    return reltimestr(reltime())[match_end : ] % a:n
endfunction

function! s:move_gvim()
    call s:move_to(['^', '>', 'v', '<'][s:rand(4)])
endfunction

let s:doing_cursormoved = 0
function! s:cursormoved()
    if s:doing_cursormoved | return | endif
    let s:doing_cursormoved = 1
    try
        call s:update_statusline()
        call s:move_gvim()
    finally
        let s:doing_cursormoved = 0
    endtry
endfunction

function! s:restore_context()
    if empty(s:context) | return | endif

    try
        " Restore statusline.
        if s:context.statusline_is_local
            set statusline<
        else
            let &statusline = s:context.statusline
        endif
        let &laststatus = s:context.laststatus
        " Unregister autocmd.
        autocmd! banban
    finally
        let s:context = {}    " let context free.
    endtry
endfunction

function! s:cmd_banban(n)
    " Save context.
    let context = {}
    let context.statusline_is_local = &l:statusline !=# ''
    let context.statusline = &l:statusline !=# '' ? &l:statusline : &statusline
    let context.laststatus = &laststatus
    let context.aa_index = 0
    let n = a:n > 0 ? a:n : 0
    let context.dx = 20 + (7 * n)
    let context.dy = 15 + (7 * n)
    let s:context = context

    " Register autocmd.
    augroup banban
        autocmd!
        autocmd CursorMoved * call s:cursormoved()
    augroup END
    " Overwrite statusline.
    let &laststatus   = 2
    let &l:statusline = '%{BanbanAA()}'
endfunction



function! s:create_ex_commands()
    for i in range(5)
        execute 'command! BanBan'.repeat('Ban', i).' call s:cmd_banban('.i.')'
    endfor
    command! BanBanYamete call s:restore_context()
endfunction
call s:create_ex_commands()


" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
