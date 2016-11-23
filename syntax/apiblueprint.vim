runtime! syntax/markdown.vim
unlet! b:current_syntax

syntax include @json syntax/json.vim

" Metadata
syntax region apibMarkdownMetadata start=/\%^.*:.*$/ end=/^$/ contains=apibMarkdownMetadataKey,apibMarkdownMetadataValue fold
syntax match apibMarkdownMetadataKey /^[^:]*\ze:/ contained
syntax match apibMarkdownMetadataValue /:.*/ contained

syntax region apibHTTPStatusCode start=/\d\d\d/ end=// contained containedin=apibResponseSection
syntax region apibHTTPContentType start=/(.*)/ end=// contained containedin=apibResponseSection

syntax region apibModelSection start=/^+ Model/ end=/$/ oneline
syntax region apibRequestSection start=/^[-+*] Request.*/ end=/^$/ contains=apibHTTPContentType
syntax region apibResponseSection start=/^[-+*] Response \d\d\d/ end=/^$/ contains=apibHTTPStatusCode,apibHTTPContentType
syntax region apibHeadersSection start=/^+ Headers$/ end=/^\S.*$/ contains=apibHeadersSectionKey,apibHeadersSectionValue

syntax region apibActionRelationKey start=/: .*/ end=/$/ contained
syntax region apibActionRelation start=/^[-+*] Relation: .*$/ end=/$/ oneline contains=apibActionRelationKey

syntax match apibHeadersSectionKey /^[^:]*\ze:/ contained
syntax match apibHeadersSectionValue /:.*/ contained

syntax region apibJSON start=/^\s*{/ end=// contained containedin=markdownCodeBlock contains=@json

highlight default link apibMarkdownMetadataKey Function
highlight default link apibRequestSection Function
highlight default link apibResponseSection Function
highlight default link apibModelSection Function
highlight default link apibHeadersSectionKey Function
highlight default link apibHTTPStatusCode Delimiter
highlight default link apibHTTPContentType Comment
highlight default link apibActionRelation Function
highlight default link apibActionRelationKey Identifier

syn sync fromstart

let b:current_syntax = 'apiblueprint'
