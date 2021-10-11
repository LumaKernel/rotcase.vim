function! rotcase#internal#util#capitalize(str) abort
  if a:str ==# ''
    return ''
  endif
  return toupper(a:str[0]) . a:str[1:]
endfunction

function! rotcase#internal#util#uncapitalize(str) abort
  if a:str ==# ''
    return ''
  endif
  return tolower(a:str[0]) . a:str[1:]
endfunction

" kebab-case
function! rotcase#internal#util#split_kebab(str) abort
  return split(a:str, '-')
endfunction
function! rotcase#internal#util#join_kebab(arr) abort
  return join(a:arr, '-')
endfunction

" snake_case
function! rotcase#internal#util#split_snake(str) abort
  return split(a:str, '_')
endfunction
function! rotcase#internal#util#join_snake(arr) abort
  return join(a:arr, '_')
endfunction

" camelCase
function! rotcase#internal#util#split_camel(str) abort
  return split(a:str, '\ze[A-Z]')
endfunction
function! rotcase#internal#util#join_camel(arr) abort
  return rotcase#internal#util#uncapitalize(rotcase#internal#util#join_pascal(a:arr))
endfunction

" PascalCase
function! rotcase#internal#util#split_pascal(str) abort
  return rotcase#internal#util#split_camel(a:str)
endfunction
function! rotcase#internal#util#join_pascal(arr) abort
  return join(map(a:arr, 'rotcase#internal#util#capitalize(tolower(v:val))'), '')
endfunction

" Value is undefined for valid input.
function! rotcase#internal#util#detect_case(str) abort
  if match(a:str, '-') >= 0
    return 'kebab'
  endif
  if match(a:str, '_') >= 0
    return 'snake'
  endif
  if match(a:str, '\C^[a-z]') >= 0
    return 'camel'
  endif
  return 'pascal'
endfunction
