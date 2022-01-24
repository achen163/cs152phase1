   /* cs152-miniL phase1 */
   
%{   
   /* write your C code here for definitions of variables and including headers */
   int currPosition = 1;
   int currLine = 1;
%}
   /* some common rules */
DIGIT        [0-9]
LETTER       [A-Za-z]
UNDERSCORE     [_]
%%
   /* specific lexer rules in regex */
"function"           {printf("FUNCTION\n"); currPosition += yyleng;}
"beginparams"        {printf("BEGIN_PARAMS\n"); currPosition += yyleng;}
"endparams"          {printf("END_PARAMS\n"); currPosition += yyleng;}
"beginlocals"        {printf("BEGIN_LOCALS\n"); currPosition += yyleng;}
"endlocals"          {printf("END_LOCALS\n"); currPosition += yyleng;}
"beginbody"          {printf("BEGIN_BODY\n"); currPosition += yyleng;}
"endbody"            {printf("END_BODY\n"); currPosition += yyleng;}
"integer"            {printf("INTEGER\n"); currPosition += yyleng;}
"array"              {printf("ARRAY\n"); currPosition += yyleng;}
"of"                 {printf("OF\n"); currPosition += yyleng;}
"if"                 {printf("IF\n"); currPosition += yyleng;}
"then"               {printf("THEN\n"); currPosition += yyleng;}
"endif"              {printf("ENDIF\n"); currPosition += yyleng;}
"else"               {printf("ELSE\n"); currPosition += yyleng;}
"while"              {printf("WHILE\n"); currPosition += yyleng;}
"do"                 {printf("DO\n"); currPosition += yyleng;}
"beginloop"          {printf("BEGINLOOP\n"); currPosition += yyleng;}
"endloop"            {printf("ENDLOOP\n"); currPosition += yyleng;}
"continue"           {printf("CONTINUE\n"); currPosition += yyleng;}
"break"              {printf("BREAK\n"); currPosition += yyleng;}
"read"               {printf("READ\n"); currPosition += yyleng;}
"write"              {printf("WRITE\n"); currPosition += yyleng;}
"not"                {printf("NOT\n"); currPosition += yyleng;}
"true"               {printf("TRUE\n"); currPosition += yyleng;}
"false"              {printf("FALSE\n"); currPosition += yyleng;}
"return"             {printf("RETURN\n"); currPosition += yyleng;}

"-"                  {printf("SUB\n"); currPosition += yyleng;}
"+"                  {printf("ADD\n"); currPosition += yyleng;}
"*"                  {printf("MULT\n"); currPosition += yyleng;}
"/"                  {printf("DIV\n"); currPosition += yyleng;}
"%"                  {printf("MOD\n"); currPosition += yyleng;}
"=="                 {printf("EQ\n"); currPosition += yyleng;}
"<>"                 {printf("NEQ\n"); currPosition += yyleng;}
"<"                  {printf("LT\n"); currPosition += yyleng;}
">"                  {printf("GT\n"); currPosition += yyleng;}
"<="                 {printf("LTE\n"); currPosition += yyleng;}
">="                 {printf("GTE\n"); currPosition += yyleng;}

[A-Za-z0-9_]*{UNDERSCORE} {printf("Error at line %d, column %d: identifier \"%s\" cannot end with underscore\n", currLine, currPosition, yytext); exit(0);}
[a-zA-Z][A-Za-z0-9_]* {printf("IDENT %s\n", yytext); currPosition += yyleng; }
{DIGIT}+             {printf("NUMBER %s\n", yytext); currPosition += yyleng;}

";"                  {printf("SEMICOLON\n"); currPosition += yyleng;}
":"                  {printf("COLON\n"); currPosition += yyleng;}
","                  {printf("COMMA\n"); currPosition += yyleng;}
"("                  {printf("L_PAREN\n"); currPosition += yyleng;}
")"                  {printf("R_PAREN\n"); currPosition += yyleng;}
"["                  {printf("L_SQUARE_BRACKET\n"); currPosition += yyleng;}
"]"                  {printf("R_SQUARE_BRACKET\n"); currPosition += yyleng;}
":="                 {printf("ASSIGN\n"); currPosition += yyleng;}


"##".*               {printf(""); currPosition += yyleng; currLine++;}
"\n"                 {printf(""); currPosition = 1; currLine++;}
"\t"                 {printf(""); currPosition += yyleng;}
" "                  {printf(""); currPosition += yyleng;}       

[0-9_]+[A-Za-z0-9_]* {printf("Error at line %d, column %d: identifier \"%s\" must begin with a letter\n", currLine, currPosition, yytext); exit(0);}

.                    {printf("Error at line %d, column %d unrecognized symbol: \"%s\"\n", currLine, currPosition, yytext); exit(0);}

%%
	/* C functions used in lexer */

int main(int argc, char ** argv)
{
   yylex();
}
