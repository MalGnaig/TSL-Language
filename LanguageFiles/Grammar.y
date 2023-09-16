{ 
module Grammar where 
import Tokens 
}

%name parseCalc 
%tokentype { Token } 
%error { parseError }
%token 
    Int       { TokenConstructorInt _}
    Tile      { TokenConstructorTile _ }
    read      { TokenFunctionRead _ }
    write     { TokenFunctionWrite _ }
    stack     { TokenFunctionStack _}
    alternate { TokenFunctionAlternate _}
    rotate    { TokenFunctionRotate _}
    scale     { TokenFunctionScale _}
    reflectX  { TokenFunctionReflectX _}
    reflectY  { TokenFunctionReflectY _}
    make_tile { TokenFunctionMakeTile _}
    getCol    { TokenFunctionGetCol _}
    getRow    { TokenFunctionGetRow _}
    blank     { TokenFunctionBlank _}
    neg       { TokenFunctionNeg _}
    modify    { TokenFunctionModify _}
    access    { TokenFunctionAccess _}
    int       { TokenInt _ $$ } 
    var       { TokenVar _ $$ }
    ';'       { TokenSemicolon _ }
    '='       { TokenAssignment _}
    '('       { TokenLParen _} 
    ')'       { TokenRParen _} 
    ','       { TokenComma _}
    '{'       { TokenLBraces _}
    '}'       { TokenRBraces _}
    '<'       { TokenLessThan _}
    '>'       { TokenGreaterThan _}
    '>='      { TokenEqGreaterThan _}
    '<='      { TokenEqLessThan _}
    '=='      { TokenEquals _ }
    '+'       { TokenPlus _}
    '-'       { TokenMinus _}
    '*'       { TokenTimes _}
    '/'       { TokenDiv _}
    '&&'      { TokenAnd _}
    '||'      { TokenOr _}
    '&'       { TokenBAnd _}
    '|'       { TokenBOr _}
    '!'       { TokenBoolNeg _}
    '%'       { TokenMod _}
    bool      { TokenBool  _ $$ }
    print     { TokenFunctionPrint _ }
    if        { TokenIf _}
    else      { TokenElse _}
    while     { TokenWhile _}
    string    { TokenString _ $$ }

%nonassoc NOELSE
%nonassoc else
%right '='
%left '|'
%left '&'
%left '||'
%left '&&'
%left '=='
%left '<' '>' '<=' '>='
%left '+' '-'
%left '*' '/' '%'
%right '!' NEG


%% 
StatementList : 
    {- empty -}  { [] }
  | StatementList Statement { $2 : $1 }

Statement :
    exp ';' { Statement $1 }
  | '{' StatementList '}' { Block (reverse $2) }
  | while '(' exp ')' Statement { While $3 $5 }
  | if '(' exp ')' Statement %prec NOELSE { If $3 $5 (Block []) }
  | if '(' exp ')' Statement else Statement {If $3 $5 $7 }
  

exp : int                                       { TmInt $1 } 
    | var                                       { TmVar $1 }
    | var '=' exp                               { TmAssign $1 $3 }
    | exp '<' exp                               { TmLessThan $1 $3 }
    | exp '>' exp                               { TmGreaterThan $1 $3 }
    | exp '<=' exp                              { TmEqLessThan $1 $3 }
    | exp '>=' exp                              { TmEqGreaterThan $1 $3 }
    | exp '==' exp                              { TmEquals $1 $3 }
    | exp '-' exp                               { TmMinus $1 $3 }
    | exp '*' exp                               { TmMult $1 $3 }
    | exp '+' exp                               { TmPlus $1 $3 }
    | exp '/' exp                               { TmDiv $1 $3 }
    | exp '&' exp                               { TmBAnd $1 $3 }
    | exp '&&' exp                              { TmAnd $1 $3 }
    | exp '|' exp                               { TmOr $1 $3 }
    | exp '||' exp                              { TmBOr $1 $3 }
    | '!' exp                                   { TmBoolNeg $2 }
    | exp '%' exp                               { TmMod $1 $3} 
    | Int var                                   { TmIntDecl $2 }
    | Tile var                                  { TmTileDecl $2 }
    | print '(' exp ')'                         { TmBuildFPrint $3 }
    | read '(' exp ')'                          { TmBuildFRead $3 }
    | write '(' exp ')'                         { TmBuildFWrite $3 Nothing}
    | write '(' exp ',' exp ')'                 { TmBuildFWrite $3 (Just $5)}
    | stack '(' exp ',' exp ')'                 { TmBuildFStack $3 $5 }
    | scale '(' exp ',' int ')'                 { TmBuildFScale $3 $5 }
    | access '(' exp ',' exp ',' exp ')'        { TmBuildFAccess $3 $5 $7 }
    | modify '(' exp ',' exp ',' exp ',' exp ')'  { TmBuildFModify $3 $5 $7 $9 }
    | alternate '(' exp ',' exp ',' int ')'     { TmBuildFAlternate $3 $5 $7 }
    | rotate '(' exp ')'                        { TmBuildFRotate $3 }
    | reflectX '(' exp ')'                      { TmBuildFReflectX $3 }
    | reflectY '(' exp ')'                      { TmBuildFReflectY $3 }
    | getCol '(' exp ')'                        { TmBuildFGetCol $3 }
    | getRow '(' exp ')'                        { TmBuildFGetRow $3 }
    | make_tile '(' int ',' int ')'             { TmBuildFMakeTile $3 $5}
    | blank '(' exp ')'                         { TmBuildFBlank $3 }
    | bool                                      { TmBool $1 }
    | string                                    { TmStr $1 }
    | neg '(' exp ')'                           { TmNeg $3 }
    | '(' exp ')'                               { $2 }



{ 
parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

data Program = Program [Statement]
   deriving (Show,Eq)


data Statement =  Statement Exp 
                | Block [Statement]
                | While Exp Statement
                | If Exp Statement Statement
   deriving (Show,Eq)

data Exp =    TmInt Int 
            | TmVar String 
            | TmAssign String Exp
            | TmIntDecl String
            | TmTileDecl String
            | TmBuildFPrint Exp
            | TmBuildFRead Exp
            | TmBuildFWrite Exp (Maybe Exp)
            | TmBuildFStack Exp Exp
            | TmBuildFScale Exp Int
            | TmBuildFAlternate Exp Exp Int
            | TmBuildFRotate Exp
            | TmBuildFReflectX Exp
            | TmBuildFReflectY Exp
            | TmBuildFMakeTile Int Int
            | TmBuildFGetCol Exp
            | TmBuildFGetRow Exp
            | TmBuildFAccess Exp Exp Exp
            | TmBuildFModify Exp Exp Exp Exp
            | TmBuildFBlank Exp
            | TmBool Bool
            | TmBoolNeg Exp
            | TmLessThan Exp Exp
            | TmPlus Exp Exp
            | TmDiv Exp Exp
            | TmGreaterThan Exp Exp
            | TmEqGreaterThan Exp Exp
            | TmEqLessThan Exp Exp
            | TmEquals Exp Exp
            | TmMod Exp Exp
            | TmMinus Exp Exp
            | TmMult Exp Exp
            | TmAnd Exp Exp
            | TmOr Exp Exp
            | TmBAnd Exp Exp
            | TmBOr Exp Exp
            | TmNeg Exp
            | TmTile [[Int]]
            | TmStr String
    deriving (Show,Eq)
} 