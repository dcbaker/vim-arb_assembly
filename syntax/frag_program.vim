"Language: ARB Fragment Assembly
"Maintainer: Dylan Baker <baker.dylan.c@gmail.com>

" Vim stuff {{{1
if exists("b:current_syntax")
    finish
endif

runtime! syntax/arb_assembly.vim

" Global matches {{{1
" Types {{{2
syn match arbFpFragment    "fragment\.color\(\.\(primary\|secondary\)\)\?"                 contained
syn match arbFpFragment    "fragment\.texcoord\(\[\d\+\]\)\?"                              contained contains=arbBraces,arbInt
syn match arbFpFragment    "fragment\.\(fragcoord\|position\)"                             contained contains=arbBraces,arbInt
syn match arbFpProgram     "program\.\(local\|env\)\[\d\+\]"                               contained contains=arbBraces,arbInt
syn match arbFpMaterials   "\(ambient\|diffuse\|specular\|emission\|shininess\)"           contained
syn match arbFpLights      "\(ambient\|diffuse\|specular\|position\|attenuation\|half\)"   contained
syn match arbFpLights      "spot\.direction"                                               contained
syn match arbFpMatrix      "\(projection\|mvp\)"                                           contained
syn match arbFpMatrix      "modelview\(\[\d\+\]\)\+"                                       contained
syn match arbFpMatrix      "texture\(\[\d\+\]\)\?"                                         contained
syn match arbFpMatrix      "\(palette\|program\)\[\d\+\]"                                  contained
syn match arbFpState       "state\.material\(\.\(back\|front\)\)\?\.[a-z]\+"               contained contains=arbFpMaterials
syn match arbFpState       "state\.light\[\d\+\]\.[a-z.\[\]]\+"                            contained contains=arbFpLights
syn match arbFpState       "state\.lightmodel\.ambient"                                    contained
syn match arbFpState       "state\.lightmodel\(\.\(front\|back\)\)\?\.screencolor"         contained
syn match arbFpState       "state\.lightprod\[\d\+\]\(\.\(front\|back\)\)\?\.\(ambient\|diffuse\|specular\)" contained
syn match arbFpState       "state\.texenv\(\[\d\+\]\)\?\.color"                            contained
syn match arbFpState       "state\.fog\.\(color\|params\)"                                 contained
syn match arbFpState       "state\.depth\.range"                                           contained
syn match arbFpState       "state\.matrix\.[.\[\]\da-z]\+"                                 contained contains=arbFpMatrix
syn match arbFpAttribBinding "fragment\.\(fogcoord\|position\)"                         contained
syn match arbFpAttribBinding "fragment\.texcoord\(\[\d\+\]\)\?\s*\d*"                   contained contains=arbBraces,arbInt
syn match arbFpAttribBinding "fragment\.color\(\.\(primary\|secondary\)\)\?"            contained

" Argument Signatures {{{2
syn match arbFpAttrib    "[a-z\.]\+\_s*=\_s*fragment\..*"                                  contained contains=arbIdentifier,arbOperator,arbFpAttribBinding
syn match arbFpSampleOp  "\_s*[a-z\.]\+\_s*,\_s*\({[-0-9\., ]\+}\|[a-z\.]\+\)\_s*,\_s*\d\+\_s*,\_s*\([123]D\|CUBE\|RECT\)" contained contains=arbFpTexTarget,arbInt,arbIdentifier,arbDelimiter
syn match arbFpParamOp   "\_s*[a-z\.]\+\_s*=\_s*[a-z\.]\+"                                 contained contains=arbIdentifier,arbOperator
syn match arbFpParamOp   "\_s*[a-z\.]\+\_s*=\_s*\d*\.\d\+"                                 contained contains=arbIdentifier,arbOperator,arbFloat
syn match arbFpParamOp   "\_s*[a-z\.]\+\_s*=\_s*{\s*\d*\.\d\+\(\s*,\s*\d*\.\d\+\)\{3}\s*}" contained contains=arbIdentifier,arbOperator,arbFpVec
syn match arbFpParamOp   "\_s*[a-z\.]\+\_s*=\_s*program.\(env\|local\)\[\d\+\]"            contained contains=arbIdentifier,arbOperator,arbFpProgram
syn match arbFpParamOp   "\_s*[a-z\.]\+\_s*=\_s*state\..*"                                 contained contains=arbFpState


" Highlights {{{2
hi def link arbFpFragment         Type
hi def link arbFpProgram          Type
hi def link arbFpState            Type
hi def link arbFpMaterials        Type
hi def link arbFpMatrix           Type
hi def link arbFpLights           Type
hi def link arbFpProgram          Type
hi def link arbFpKeyword          arbKeyword
hi def link arbFpStart            arbKeyword
hi def link arbFpAttribBinding    Type


" Commands {{{1
" Special {{{2
syn match arbFpStart   "^!!ARBfp1.0" nextgroup=arbErr
syn match arbFpEnd     "^END"        nextgroup=arbErr contains=arbKeyword

" Regions {{{2
" Special {{{3
syn region arbFpRegion matchgroup=arbFpKeyword start="^OPTION" end=";"           keepend contains=arbOption,arbDelimiter
syn region arbFpRegion matchgroup=arbFpKeyword start="^SWZ"    end=";"           keepend contains=arbSwizType,arbVectorOp,arbDelimiter
syn region arbFpRegion matchgroup=arbFpKeyword start="^KIL"    end=";"           keepend contains=arbIdentifier

" dest + vector {{{3
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(ABS_SAT\|ABS\)" end=";" keepend contains=arbVectorOp,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(FLR_SAT\|FLR\)" end=";" keepend contains=arbVectorOp,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(FRC_SAT\|FRC\)" end=";" keepend contains=arbVectorOp,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(LIT_SAT\|LIT\)" end=";" keepend contains=arbVectorOp,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(MOV_SAT\|MOV\)" end=";" keepend contains=arbVectorOp,arbErr


" dest + 2 vectors {{{3
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(ADD_SAT\|ADD\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(DP3_SAT\|DP3\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(DP4_SAT\|DP4\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(DPH_SAT\|DPH\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(DST_SAT\|DST\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(MAX_SAT\|MAX\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(MIN_SAT\|MIN\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(MUL_SAT\|MUL\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(SGE_SAT\|SGE\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(SLT_SAT\|SLT\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(SUB_SAT\|SUB\)" end=";" keepend contains=arbVectorOp2,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(CMP_SAT\|CMP\)" end=";" keepend contains=arbVectorOp2,arbErr

" dest + 3 vectors {{{3
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(XPD_SAT\|XPD\)" end=";" keepend contains=arbVectorOp3,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(LRP_SAT\|LRP\)" end=";" keepend contains=arbVectorOp3,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(MAD_SAT\|MAD\)" end=";" keepend contains=arbVectorOp3,arbErr

" dest + scalars {{{3
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(COS_SAT\|COS\)" end=";" keepend contains=arbScalarOp,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(EX2_SAT\|EX2\)" end=";" keepend contains=arbScalarOp,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(LG2_SAT\|LG2\)" end=";" keepend contains=arbScalarOp,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(RCP_SAT\|RCP\)" end=";" keepend contains=arbScalarOp,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(RSQ_SAT\|RSQ\)" end=";" keepend contains=arbScalarOp,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(SIN_SAT\|SIN\)" end=";" keepend contains=arbScalarOp,arbErr
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(SCS_SAT\|SCS\)" end=";" keepend contains=arbScalarOp,arbErr

" dest + 2 scalars {{{3
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(POW_SAT\|POW\)" end=";" keepend contains=arbScalarOp2,arbErr

" sample {{{3
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(TEX_SAT\|TEX\)" end=";" keepend contains=arbFpSampleOp
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(TXP_SAT\|TXP\)" end=";" keepend contains=arbFpSampleOp
syn region arbFpRegion matchgroup=arbFpKeyword start="^\(TXB_SAT\|TXB\)" end=";" keepend contains=arbFpSampleOp

" Naming {{{3
syn region arbFpRegion matchgroup=arbFpKeyword start="^ATTRIB"           end=";" keepend contains=arbFpAttrib
syn region arbFpRegion matchgroup=arbFpKeyword start="^PARAM"            end=";" keepend contains=arbFpParamOp

" vim stuff {{{1
let b:current_syntax = "ARB fragment assembly"

" vim: foldmethod=marker spell
