if exists('g:rotcase_loaded')
  finish
endif
let g:rotcase_loaded = 1

nnoremap <silent> <Plug>(rotcase:rot-small) :<c-u>call rotcase#internal#helper#rot_cword(['snake', 'kebab'])<cr>
nnoremap <silent> <Plug>(rotcase:rot-all) :<c-u>call rotcase#internal#helper#rot_cword(['snake', 'kebab', 'camel', 'pascal'])<cr>
