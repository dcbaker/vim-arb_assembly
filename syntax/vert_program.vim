"Language: ARB Vertex Assembly
"Maintainer: Dylan Baker <baker.dylan.c@gmail.com>

" Vim stuff {{{1
if exists("b:current_syntax")
    finish
endif

runtime! syntax/arb_assembly.vim

" Highlight groups {{{1
hi def link arbVpKeyword     arbKeyword
hi def link arbVpStart       arbVpKeyword

" Commands {{{1
" Special {{{2
syn match arbVpStart   "!!ARBvp1.0" nextgroup=arbErr
syn match arbVpEnd     "END"        nextgroup=arbErr contains=arbKeyword

" Regions {{{2
" Special {{{3
syn region arbVpRegion matchgroup=arbVpKeyword start="^OPTION" end=";"           keepend contains=arbOption,arbDelimiter
syn region arbVpRegion matchgroup=arbVpKeyword start="^SWZ"    end=";"           keepend contains=arbSwizType,arbVectorOp,arbDelimiter
syn region arbVpRegion matchgroup=arbVpKeyword start="^ARL"    end=";"           keepend contains=arbIdOp

" dest + vector {{{3
syn region arbVpRegion matchgroup=arbVpKeyword start="^ABS" end=";" keepend contains=arbVectorOp,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^FLR" end=";" keepend contains=arbVectorOp,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^FRC" end=";" keepend contains=arbVectorOp,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^LIT" end=";" keepend contains=arbVectorOp,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^MOV" end=";" keepend contains=arbVectorOp,arbErr


" dest + 2 vectors {{{3
syn region arbVpRegion matchgroup=arbVpKeyword start="^ADD" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^DP3" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^DP4" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^DPH" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^DST" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^MAX" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^MIN" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^MUL" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^SGE" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^SLT" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^SUB" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^XPD" end=";" keepend contains=arbVectorOp2,arbErr

" dest + 3 vectors {{{3
syn region arbVpRegion matchgroup=arbVpKeyword start="^MAD" end=";" keepend contains=arbVectorOp3,arbErr

" dest + scalars {{{3
syn region arbVpRegion matchgroup=arbVpKeyword start="^EX2" end=";" keepend contains=arbScalarOp,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^EXP" end=";" keepend contains=arbScalarOp,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^LG2" end=";" keepend contains=arbScalarOp,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^LOG" end=";" keepend contains=arbScalarOp,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^RCP" end=";" keepend contains=arbScalarOp,arbErr
syn region arbVpRegion matchgroup=arbVpKeyword start="^RSQ" end=";" keepend contains=arbScalarOp,arbErr

" dest + 2 scalars {{{3
syn region arbVpRegion matchgroup=arbVpKeyword start="^POW" end=";" keepend contains=arbScalarOp2,arbErr


" vim stuff {{{1
let b:current_syntax = "ARB vertex assembly"

" vim: foldmethod=marker spell
