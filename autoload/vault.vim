" Author: cappyzawa <cappyzawa@yahoo.ne.jp>

let s:save_cpo = &cpo
set cpo&vim

let s:vault = {
      \ 'path_prefix': g:vault_default_path_prefix,
      \ 'field': g:vault_default_field,
      \ }

let s:popup_flag = v:false

function! vault#path_prefix() abort
  let s:vault.path_prefix = input('Vault Path Prefix: ')
endfunction

function! vault#field() abort
  let s:vault.field = input('Vault Field: ')
endfunction

function! vault#read() abort
  if s:popup_flag
    call vault#popup#close()
    let s:popup_flag = v:false
    return
  endif
  let l:tmp = @@
  silent normal gvy
  let l:selected = @@
  let @@ = l:tmp
  let l:cmd = vault#cmd#new(s:vault.path_prefix, s:vault.field)
  let l:secret = l:cmd.read(l:selected)
  call vault#popup#open(l:secret)
  let s:popup_flag = v:true
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
