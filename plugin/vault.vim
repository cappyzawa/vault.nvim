" Author: cappyzawa <cappyzawa@yahoo.ne.jp>

if exists('g:loaded_vault')
  finish
endif

let g:loaded_vault = 1

let s:save_cpo = &cpo
set cpo&vim

" plugin code is here
command! -bar VaultPathPrefix call vault#path_prefix()
command! -bar VaultField call vault#field()
command! -bar VaultRead call vault#read()

nnoremap <silent> <Plug>(vault-path-prefix) :<C-u>VaultPathPrefix<CR>
nnoremap <silent> <Plug>(vault-field) :<C-u>VaultField<CR>
xnoremap <silent> <Plug>(vault-read) :<C-u>VaultRead<CR>
nnoremap <silent> <Plug>(vault-read) :<C-u>VaultRead<CR>

if !exists('g:vault_default_path_prefix')
  let g:vault_default_path_prefix = ''
endif

if !exists('g:vault_default_field')
  let g:vault_default_field = 'value'
endif

if !exists('g:vault_no_default_mapping')
  let g:vault_no_default_mappings = v:false
endif
if !g:vault_no_default_mappings
  nmap <Leader>vpp <Plug>(vault-path-prefix)
  nmap <Leader>vf <Plug>(vault-field)
  nmap <Leader>vr <Plug>(vault-read)
  xmap <Leader>vr <Plug>(vault-read)
endif

let &cpo = s:save_cpo
unlet s:save_cpo
