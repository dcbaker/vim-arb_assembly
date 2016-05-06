"Language: ARB Vertex Assembly
"Maintainer: Dylan Baker <baker.dylan.c@gmail.com>

" Vim stuff {{{1
if exists("b:current_syntax")
    finish
endif

runtime! syntax/arb_assembly.vim

" Commands {{{1
" Special {{{2
syn match arbVpStart   "!!ARBvp1.0" nextgroup=arbErr
syn match arbVpEnd     "END"        nextgroup=arbErr contains=arbKeyword

" Regions {{{2
" Special {{{3
syn region arbVpRegion matchgroup=arbKeyword start="^OPTION" end=";"           keepend contains=arbOption,arbDelimiter
syn region arbVpRegion matchgroup=arbKeyword start="^SWZ"    end=";"           keepend contains=arbSwizType,arbVectorOp,arbDelimiter
syn region arbVpRegion matchgroup=arbKeyword start="^ARL"    end=";"           keepend contains=arbIdOp

" dest + vector {{{3
syn region arbVpRegion matchgroup=arbKeyword start="^ABS" end=";" keepend contains=arbVectorOp,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^FLR" end=";" keepend contains=arbVectorOp,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^FRC" end=";" keepend contains=arbVectorOp,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^LIT" end=";" keepend contains=arbVectorOp,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^MOV" end=";" keepend contains=arbVectorOp,arbErr


" dest + 2 vectors {{{3
syn region arbVpRegion matchgroup=arbKeyword start="^ADD" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^DP3" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^DP4" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^DPH" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^DST" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^MAX" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^MIN" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^MUL" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^SGE" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^SLT" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^SUB" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^XPD" end=";" keepend contains=arbVectorOp2,arbErr

" dest + 3 vectors {{{3
syn region arbVpRegion matchgroup=arbKeyword start="^MAD" end=";" keepend contains=arbVectorOp3,arbErr

" dest + scalars {{{3
syn region arbVpRegion matchgroup=arbKeyword start="^EX2" end=";" keepend contains=arbScalarOp,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^EXP" end=";" keepend contains=arbScalarOp,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^LG2" end=";" keepend contains=arbScalarOp,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^LOG" end=";" keepend contains=arbScalarOp,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^RCP" end=";" keepend contains=arbScalarOp,arbErr
syn region arbVpRegion matchgroup=arbKeyword start="^RSQ" end=";" keepend contains=arbScalarOp,arbErr

" dest + 2 scalars {{{3
syn region arbVpRegion matchgroup=arbKeyword start="^POW" end=";" keepend contains=arbScalarOp2,arbErr


" vim stuff {{{1
let b:current_syntax = "ARB vertex assembly"

" vim: foldmethod=marker spell
