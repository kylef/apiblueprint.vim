autocmd BufReadPost,BufNewFile *.apib set filetype=apiblueprint
autocmd FileType apiblueprint set syntax=apiblueprint
autocmd FileType apiblueprint set makeprg=snowcrash\ -l\ %

