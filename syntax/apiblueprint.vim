runtime! syntax/markdown.vim
unlet! b:current_syntax

" Metadata
syntax region apibMarkdownMetadata start=/\%^.*:.*$/ end=/^$/ contains=apibMarkdownMetadataKey,apibMarkdownMetadataValue fold
syntax match apibMarkdownMetadataKey /^[^:]*\ze:/ contained
syntax match apibMarkdownMetadataValue /:.*/ contained

highlight link apibMarkdownMetadataKey Function

syntax region apibRequestSection start=/^+ Request (.*)$/ end=/$/ oneline
highlight link apibRequestSection Function

syntax region apibResponseSection start=/^+ Response \d\d\d (.*)$/ end=/$/ oneline
highlight link apibResponseSection Function

syntax region apibHeadersSection start=/^+ Headers$/ end=/^\S.*$/ contains=apibHeadersSectionKey,apibHeadersSectionValue
syntax match apibHeadersSectionKey /^[^:]*\ze:/ contained
syntax match apibHeadersSectionValue /:.*/ contained
highlight link apibHeadersSectionKey Function

let b:current_syntax = 'apiblueprint'

