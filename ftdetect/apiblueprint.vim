autocmd BufReadPost,BufNewFile *.apib set filetype=apiblueprint
autocmd FileType apiblueprint set syntax=apiblueprint
autocmd FileType apiblueprint set makeprg=drafter\ -l\ %

fun! s:DetectAPIBlueprint()
  if getline(1) =~ '^FORMAT: 1A$'
    set filetype=apiblueprint
  endif
endfun

autocmd BufNewFile,BufRead * call s:DetectAPIBlueprint()

