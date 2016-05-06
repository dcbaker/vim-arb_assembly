" Shared code for arb_fragment_program and arb_vertex_program
"Maintainer: Dylan Baker <baker.dylan.c@gmail.com>

" Global matches {{{1
" Types {{{2
syn match arbErr         "\s*#\@!.\+"                                                    contained nextgroup=arbErr
syn match arbInt         "-\?\d\+"                                                       contained
syn match arbFloat       "-\?\d*\.\d\+"                                                  contained
syn match arbDelimiter   "[,;\.]"                                                        contained
syn match arbBraces      "[\[\]{}]"                                                      contained
syn match arbKeyword     "[A-Z]\+"                                                       contained
syn match arbSwizzle     "\.[xyzw]"                                                      contained contains=arbDelimiter
syn match arbSwizzle     "\.[rgba]"                                                      contained contains=arbDelimiter
syn match arbExtension   "ARB_[a-z_]\+"                                                  contained
syn match arbComment     "#.*$"                                                                    contains=Todo
syn match arbOperator    "[=]"                                                           contained
syn match arbSwizType    "[01rgba]\(,[01rgba]\)\{3}"                                     contained contains=arbDelimiter
syn match arbSwizType    "[01xyzw]\(,[01xyzw]\)\{3}"                                     contained contains=arbDelimiter
syn match arbTexTarget   "\([123]D\|CUBE\|RECT\)"                                        contained
syn match arbVec         "{\s*\(-\?\d*\.\d\+\s*,\s*\)\{3}-\?\d*\.\d\+\s*}"               contained contains=arbDelimiter,arbBraces,arbFloat
syn match arbSpecial     "program\.\(local\|env\)"                                       contained
syn match arbIdentifier  "[a-z]\+\(\.[a-z]\+\)\?\(\[\d\+\]\)\?"                          contained contains=arbType,arbBraces,arbInt,arbSwizzle,arbSpecial

" Argument Signatures {{{2
syn match arbVectorOp   "\_s*[a-z\.]\+\_s*,\_s*\({[-0-9\., ]\+}\|[a-z\.]\+\)"             contained contains=arbVec,arbIdentifier,arbDelimiter
syn match arbVectorOp2  "\_s*[a-z\.]\+\(\_s*,\_s*\({[-0-9\., ]\+}\|[a-z\.]\)\+\)\{2}"     contained contains=arbVec,arbIdentifier,arbDelimiter
syn match arbVectorOp3  "\_s*[a-z\.]\+\(\_s*,\_s*\({[-0-9\., ]\+}\|[a-z\.]\)\+\)\{3}"     contained contains=arbVec,arbIdentifier,arbDelimiter
syn match arbScalarOp   "\_s*[a-z\.]\+\_s*,\_s*\([-0-9\. ]\+\|[a-z\.]\+\)"                contained contains=arbFloat,arbIdentifier,arbDelimiter
syn match arbScalarOp2  "\_s*[a-z\.]\+\(\_s*,\_s*\([-0-9\. ]\+\|[a-z\.]\+\)\)\{2}"        contained contains=arbFloat,arbIdentifier,arbDelimiter
syn match arbOption     "\_s*[A-Za-z_]\+"                                                 contained contains=arbExtension
syn match arbIdOp       "\_s*[a-z\.]\+\_s*,\_s*\[a-z\.]\+"                                contained contains=arbIdentifier,arbDelimiter
syn match arbNameListOp "\(\_s*[a-z\.]\+\_s*,\?\)\+"                                      contained contains=arbIdentifier,arbDelimiter
syn match arbAliasOp   "\_s*[a-z]\+\_s*=\_s*[a-z]\+"                                      contained contains=arbIdentifier,arbOperator

" Highlights {{{2
hi def link arbErr              Error
hi def link arbInt              Number
hi def link arbFloat            Float
hi def link arbComment          Comment
hi def link arbDelimiter        Delimiter
hi def link arbBraces           Operator
hi def link arbOperator         Operator
hi def link arbKeyword          Keyword
hi def link arbStart            Keyword
hi def link arbExtension        String
hi def link arbSwizzle          String
hi def link arbSwizType         String
hi def link arbTexTarget        StorageClass
hi def link arbSpecial          Type

" vim: foldmethod=marker spell
