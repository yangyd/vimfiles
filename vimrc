
" path separator
let s:sep = exists('+shellslash') && !&shellslash ? '\' : '/'

" find out our 'config' directory from the runtimepath
let s:cfgdir = filter(map(filter(split(&runtimepath, ','), "v:val !~# 'after$'"),
      \                   "join([expand(v:val), 'config'], s:sep)"),
      \               'isdirectory(v:val)')[0]

execute pathogen#infect()

for s:cfgfile in ['mainconf.vim', 'keymaps.vim', 'extra.vim']
  execute 'source ' . join([s:cfgdir, s:cfgfile], s:sep)
endfor

