" Author: cappyzawa <cappyzawa@yahoo.ne.jp>

let s:popup = {
      \ 'window': 0,
      \ }

function! vault#popup#open(secret)
  call s:popup.open(a:secret)
endfunction

function! vault#popup#close()
  call s:popup.close()
endfunction

function! s:popup.open(str) dict abort
  let s:buf = nvim_create_buf(0,1)
  let l:str = split(a:str, "\n", 1)
  call nvim_buf_set_lines(s:buf, 0, -1, 0, l:str)
  let l:self.window = nvim_open_win(s:buf, v:false, {
      \   'height': 20,
      \   'width': 40,
      \   'relative': 'cursor',
      \   'focusable': v:true,
      \   'anchor': 'NW',
      \   'row': 0,
      \   'col': 70,
      \   'external': v:false,
      \})
endfunction

function! s:popup.close() dict abort
  call nvim_win_close(l:self.window, 1)
endfunction
