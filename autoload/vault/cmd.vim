" Author: cappyzawa <cappyzawa@yahoo.ne.jp>

let s:cmd = {
      \ 'path_prefix': '',
      \ 'field': 'value',
      \ }

function! vault#cmd#new(path_prefix, field)
  let s:cmd.path_prefix = a:path_prefix
  let s:cmd.field = a:field
  return s:cmd
endfunction

function! s:cmd.read(path) abort
  return system('vault read -field ' . s:cmd.field . ' ' . s:cmd.path_prefix . '/'. a:path)
endfunction
