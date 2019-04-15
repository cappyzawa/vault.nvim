" Author: cappyzawa <cappyzawa@yahoo.ne.jp>

let s:popup = {
      \ 'window': 0,
      \ 'height': 0,
      \ 'width': 0,
      \ }

function! vault#popup#open(secret)
  call s:popup.open(a:secret)
endfunction

function! vault#popup#close()
  call s:popup.close()
endfunction

function! s:popup.size(strs) abort
  let l:max_width = 0
  for l:s in a:strs
    if l:max_width <= strlen(l:s)
      let l:max_width = strlen(l:s)
    endif
  endfor
  let l:self.width = l:max_width
  let l:self.height = len(a:strs)
endfunction

function! s:popup.open(str) abort
  let s:buf = nvim_create_buf(0,1)
  let l:strs = split(a:str, "\n", 1)
  call l:self.size(l:strs)
  let l:self.window = nvim_open_win(s:buf, v:true, {
      \   'height': l:self.height,
      \   'width': l:self.width + 3,
      \   'relative': 'cursor',
      \   'focusable': v:true,
      \   'anchor': 'NW',
      \   'row': 1,
      \   'col': 1,
      \   'external': v:false,
      \})
  call nvim_buf_set_lines(s:buf, 0, -1, 0, l:strs)
endfunction

function! s:popup.close() abort
  call nvim_win_close(l:self.window, 1)
endfunction
