" Author: cappyzawa <cappyzawa@yahoo.ne.jp>

let s:floating_window_available = has('nvim') && exists('*nvim_win_set_config')

let s:popup = {
      \ 'window': 0,
      \ 'id': 0,
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
  let l:strs = split(a:str, "\n", 1)
  if s:floating_window_available
    let s:buf = nvim_create_buf(0,1)
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
    let l:self.window_id = win_getid()
    return
  endif

  new
  let l:self.window_id = win_getid()
  setlocal
    \ buftype=nofile bufhidden=wipe nomodified nobuflisted noswapfile nonumber
    \ nocursorline wrap nonumber norelativenumber signcolumn=no nofoldenable
    \ nospell nolist nomodeline
  for l:s in l:strs
    call append('$',l:s)
  endfor
  setlocal nomodified nomodifiable
endfunction

function! s:popup.close() abort
  if s:floating_window_available
    call nvim_win_close(l:self.window, 1)
  else
    let l:self.window = win_id2win(l:self.window_id)
    execute l:self.window . 'wincmd c'
  endif
  unlet l:self.window
endfunction
