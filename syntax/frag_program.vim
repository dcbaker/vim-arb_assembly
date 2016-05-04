"Language: ARB Fragment Assembly
"Maintainer: Dylan Baker <baker.dylan.c@gmail.com>

" Vim stuff {{{1
if exists("b:current_syntax")
    finish
endif

runtime! syntax/arb_assembly.vim

" Global matches {{{1
" Types {{{2
syn match arbType        "fragment\.color\(\.\(primary\|secondary\)\)\?"                 contained
syn match arbType        "fragment\.texcoord\(\[\d\+\]\)\?"                              contained contains=arbBraces,arbInt
syn match arbType        "fragment\.\(fragcoord\|position\)"                             contained contains=arbBraces,arbInt
syn match arbProgram     "program\.\(local\|env\)\[\d\+\]"                               contained contains=arbBraces,arbInt
syn match arbMaterials   "\(ambient\|diffuse\|specular\|emission\|shininess\)"           contained
syn match arbLights      "\(ambient\|diffuse\|specular\|position\|attenuation\|half\)"   contained
syn match arbLights      "spot\.direction"                                               contained
syn match arbMatrix      "\(projection\|mvp\)"                                           contained
syn match arbMatrix      "modelview\(\[\d\+\]\)\+"                                       contained
syn match arbMatrix      "texture\(\[\d\+\]\)\?"                                         contained
syn match arbMatrix      "\(palette\|program\)\[\d\+\]"                                  contained
syn match arbState       "state\.material\(\.\(back\|front\)\)\?\.[a-z]\+"               contained contains=arbMaterials
syn match arbState       "state\.light\[\d\+\]\.[a-z.\[\]]\+"                            contained contains=arbLights
syn match arbState       "state\.lightmodel\.ambient"                                    contained
syn match arbState       "state\.lightmodel\(\.\(front\|back\)\)\?\.screencolor"         contained
syn match arbState       "state\.lightprod\[\d\+\]\(\.\(front\|back\)\)\?\.\(ambient\|diffuse\|specular\)" contained
syn match arbState       "state\.texenv\(\[\d\+\]\)\?\.color"                            contained
syn match arbState       "state\.fog\.\(color\|params\)"                                 contained
syn match arbState       "state\.depth\.range"                                           contained
syn match arbState       "state\.matrix\.[.\[\]\da-z]\+"                                 contained contains=arbMatrix

" Argument Signatures {{{2
syn match arbAttrib    "[a-z\.]\+\_s*=\_s*fragment\.\(fogcoord\|position\)"              contained contains=arbIdentifier,arbOperator
syn match arbAttrib    "[a-z\.]\+\_s*=\_s*fragment\.texcoord\(\_s\+\d\+\)\?"             contained contains=arbIdentifier,arbOperator,arbInt
syn match arbAttrib    "[a-z\.]\+\_s*=\_s*fragment\.color\(\.\(primary\|secondary\)\)\?" contained contains=arbIdentifier,arbOperator,arbInt
syn match arbSampleOp  "\_s*[a-z\.]\+\_s*,\_s*\({[-0-9\., ]\+}\|[a-z\.]\+\)\_s*,\_s*\d\+\_s*,\_s*\([123]D\|CUBE\|RECT\)" contained contains=arbTexTarget,arbInt,arbIdentifier,arbDelimiter
syn match arbParamOp   "\_s*[a-z\.]\+\_s*=\_s*[a-z\.]\+"                                 contained contains=arbIdentifier,arbOperator
syn match arbParamOp   "\_s*[a-z\.]\+\_s*=\_s*\d*\.\d\+"                                 contained contains=arbIdentifier,arbOperator,arbFloat
syn match arbParamOp   "\_s*[a-z\.]\+\_s*=\_s*{\s*\d*\.\d\+\(\s*,\s*\d*\.\d\+\)\{3}\s*}" contained contains=arbIdentifier,arbOperator,arbVec
syn match arbParamOp   "\_s*[a-z\.]\+\_s*=\_s*program.\(env\|local\)\[\d\+\]"            contained contains=arbIdentifier,arbOperator,arbProgram
syn match arbParamOp   "\_s*[a-z\.]\+\_s*=\_s*state\..*"                                 contained contains=arbState


" Highlights {{{2
hi def link arbType             Type
hi def link arbProgram          Type
hi def link arbState            Type
hi def link arbMaterials        Type
hi def link arbMatrix           Type
hi def link arbLights           Type


" Commands {{{1
" Special {{{2
syn match arbStart   "!!ARBfp1.0" nextgroup=arbErr
syn match arbEnd     "END"        nextgroup=arbErr contains=arbKeyword

" Regions {{{2
" Special {{{3
syn region arbRegion matchgroup=arbKeyword start="^OPTION" end=";"           keepend contains=arbOption,arbDelimiter
syn region arbRegion matchgroup=arbKeyword start="^SWZ"    end=";"           keepend contains=arbSwizType,arbVectorOp,arbDelimiter
syn region arbRegion matchgroup=arbKeyword start="^KIL"    end=";"           keepend contains=arbIdentifier

" dest + vector {{{3
syn region arbRegion matchgroup=arbKeyword start="^\(ABS\|ABS_SAT\)" end=";" keepend contains=arbVectorOp,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(FLR\|FLR_SAT\)" end=";" keepend contains=arbVectorOp,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(FRC\|FRC_SAT\)" end=";" keepend contains=arbVectorOp,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(LIT\|LIT_SAT\)" end=";" keepend contains=arbVectorOp,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(MOV\|MOV_SAT\)" end=";" keepend contains=arbVectorOp,arbErr


" dest + 2 vectors {{{3
syn region arbRegion matchgroup=arbKeyword start="^\(ADD\|ADD_SAT\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(DP3\|DP3_SAT\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(DP4\|DP4_SAT\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(DPH\|DPH_SAT\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(DST\|DST_SAT\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(MAX\|MAX_SAT\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(MIN\|MIN_SAT\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(MUL\|MUL_SAT\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(SGE\|SGE_SAT\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(SLT\|SLT_SAT\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(SUB\|SUB_SAT\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(CMP\|CMP_SAT\)" end=";" keepend contains=arbVectorOp2,arbErr

" dest + 3 vectors {{{3
syn region arbRegion matchgroup=arbKeyword start="^\(XPD\|XPD_SAT\)" end=";" keepend contains=arbVectorOp3,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(LRP\|LRP_SAT\)" end=";" keepend contains=arbVectorOp3,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(MAD\|MAD_SAT\)" end=";" keepend contains=arbVectorOp3,arbErr

" dest + scalars {{{3
syn region arbRegion matchgroup=arbKeyword start="^\(COS\|COS_SAT\)" end=";" keepend contains=arbScalarOp,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(EX2\|EX2_SAT\)" end=";" keepend contains=arbScalarOp,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(LG2\|LG2_SAT\)" end=";" keepend contains=arbScalarOp,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(RCP\|RCP_SAT\)" end=";" keepend contains=arbScalarOp,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(RSQ\|RSQ_SAT\)" end=";" keepend contains=arbScalarOp,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(SIN\|SIN_SAT\)" end=";" keepend contains=arbScalarOp,arbErr
syn region arbRegion matchgroup=arbKeyword start="^\(SCS\|SCS_SAT\)" end=";" keepend contains=arbScalarOp,arbErr

" dest + 2 scalars {{{3
syn region arbRegion matchgroup=arbKeyword start="^\(POW\|POW_SAT\)" end=";" keepend contains=arbScalarOp2,arbErr

" sample {{{3
syn region arbRegion matchgroup=arbKeyword start="^\(TEX\|TEX_SAT\)" end=";" keepend contains=arbSampleOp
syn region arbRegion matchgroup=arbKeyword start="^\(TXP\|TXP_SAT\)" end=";" keepend contains=arbSampleOp
syn region arbRegion matchgroup=arbKeyword start="^\(TXB\|TXB_SAT\)" end=";" keepend contains=arbSampleOp

" Naming {{{3
syn region arbRegion matchgroup=arbKeyword start="^ATTRIB"           end=";" keepend contains=arbAttrib
syn region arbRegion matchgroup=arbKeyword start="^PARAM"            end=";" keepend contains=arbParamOp

" vim stuff {{{1
let b:current_syntax = "ARB fragment assembly"

" vim: foldmethod=marker spell
