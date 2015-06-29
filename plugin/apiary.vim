function! FetchBlueprint()
  let api_name = split(expand("%"), ':')[1]
  let blueprint = system("apiary fetch --output=/dev/fd/1 --api-name=" . shellescape(api_name))
  call append(0, split(blueprint, '\n'))
  set filetype=apiblueprint
  normal gg
endfunction

augroup Apiary
  au!
  au BufReadCmd apiary:* call FetchBlueprint()
  au FileReadCmd apiary:* call FetchBlueprint()
augroup END

