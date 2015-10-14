let s:bname = '__Refract__'
let s:command = 'drafter -f json'

function! GenerateRefract()
  let blueprint = join(getline(1, '$'), "\n")
  let refract = split(system(s:command, blueprint), "\n")

  call s:SelectWindow(s:bname)
  call s:ClearWindow(s:bname)
  call s:SelectWindow(s:bname)
  call s:PrintOutput(refract)
endfunction

function! s:SelectWindow(name)
  if bufwinnr('^' . a:name . '$') < 0
    call s:CreateWindow(a:name)
  else
    wincmd P
  endif
endfunction

function! s:ClearWindow(name)
  if bufwinnr('^' . a:name . '$') < 0
    return
  endif

  setlocal modifiable
  silent! normal! ggdG
  setlocal nomodifiable
  redraw!
endfunction

function! s:CreateWindow(name)
  silent execute 'pedit ' . a:name
  wincmd P

  call s:SetupWindow()
endfunction

function! s:SetupWindow()
  setlocal buftype=nowrite bufhidden=wipe nobuflisted
  setlocal noswapfile nowrap nomodifiable
  setlocal conceallevel=2
  setlocal concealcursor=nivc
  setlocal syntax=json
endfunction

function! s:SelectWindow(name)
  if bufwinnr('^' . a:name . '$') < 0
    call s:CreateWindow(a:name)
  else
    wincmd P
  endif
endfunction

function! s:PrintOutput(output)
  setlocal modifiable
  call append(0, a:output)
  setlocal nomodifiable
  normal gg
endfunction

autocmd FileType apiblueprint nnoremap <C-b> :call GenerateRefract()<cr>
