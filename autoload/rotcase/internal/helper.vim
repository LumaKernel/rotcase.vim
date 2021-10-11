function! rotcase#internal#helper#rot(str, cases) abort
  let case = rotcase#internal#util#detect_case(a:str)
  let i = (index(a:cases, case) + 1) % len(a:cases)
  let arr = rotcase#internal#util#split_{case}(a:str)
  let str = rotcase#internal#util#join_{a:cases[i]}(arr)
  return str
endfunction

function! rotcase#internal#helper#cword_info() abort
  let line = getline('.')
  let col = col('.') - 1
  let from = match(line[:col], '\k*$')
  let to = match(line[col:], '\k\+\zs')
  if to is# -1
    let to = 0
  endif
  let to += col
  return {'from': from, 'to': to}
endfunction

function! rotcase#internal#helper#rot_cword(cases) abort
  let cword = expand('<cword>')
  let str = rotcase#internal#helper#rot(cword, a:cases)
  let cword_info = rotcase#internal#helper#cword_info()
  let line = getline('.')
  let line_new = cword_info.from <= 1 ? '' : line[: cword_info.from - 1]
  let line_new .= str . line[cword_info.to :]
  call setline('.', line_new)
  return ''
endfunction
