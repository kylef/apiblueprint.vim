function! FetchBlueprint()
  let api_name = split(expand("%"), ':')[1]
  let blueprint = system("apiary fetch --output=/dev/fd/1 --api-name=" . shellescape(api_name))
  call append(0, split(blueprint, '\n'))
  set filetype=apiblueprint
  normal gg
endfunction

function! PublishBlueprint()
  let api_name = split(expand("%"), ':')[1]
  let blueprint = join(getline(1, '$'), "\n")
  let result = system("apiary publish --path=/dev/fd/0 --api-name=" . shellescape(api_name), blueprint)
  echomsg result
endfunction

augroup Apiary
  au!
  au BufReadCmd apiary:* call FetchBlueprint()
  au FileReadCmd apiary:* call FetchBlueprint()
  au BufWriteCmd apiary:* call PublishBlueprint()
  au FileWriteCmd apiary:* call PublishBlueprint()
augroup END

