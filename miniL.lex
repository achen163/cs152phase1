   /* cs152-miniL phase1 */
   
%{   
   /* write your C code here for definitions of variables and including headers */
%}

   /* some common rules */
DIGIT        [0-9]
LETTER       [A-Za-z]

%%
   /* specific lexer rules in regex */
"function"           {printf("FUNCTION\n");}
"beginparams"        {printf("BEGIN_PARAMS\n");}
"endparams"          {printf("END_PARAMS\n");}
"beginlocals"        {printf("BEGIN_LOCALS\n");}
"endlocals"          {printf("END_LOCALS\n");}
"beginbody"          {printf("BEGIN_BODY\n");}
"endbody"            {printf("END_BODY\n");}
"integer"            {printf("INTEGER\n");}
"array"              {printf("ARRAY\n");}
"of"                 {printf("OF\n");}
"if"                 {printf("IF\n");}
"then"               {printf("THEN\n");}
"endif"              {printf("END_IF\n");}
"else"               {printf("ELSE\n");}
"while"              {printf("WHILE\n");}
"do"                 {printf("DO\n");}
"beginloop"          {printf("BEGINLOOP\n");}
"endloop"            {printf("ENDLOOP\n");}
"continue"           {printf("CONTINUE\n");}
"break"              {printf("BREAK\n");}
"read"               {printf("READ\n");}
"write"              {printf("WRITE\n");}
"not"                {printf("NOT\n");}
"true"               {printf("TRUE\n");}
"false"              {printf("FALSE\n");}
"return"             {printf("RETURN\n");}

"-"                  {printf("SUB\n");}
"+"                  {printf("ADD\n");}
"*"                  {printf("MULT\n");}
"/"                  {printf("DIV\n");}
"%"                  {printf("MOD\n");}

"=="                 {printf("EQ\n");}
"<>"                 {printf("NEQ\n");}
"<"                  {printf("LT\n");}
">"                  {printf("GT\n");}
"<="                 {printf("LTE\n");}
">="                 {printf("GTE\n");}

{DIGIT}+             {printf("NUMBER %s\n", yytext);}
/*fix this */
({LETTER}({DIGIT}|{LETTER}|"_")*) {printf("IDENT %s\n", yytext);}

";"                  {printf("SEMICOLON\n");}
":"                  {printf("COLON\n");}
","                  {printf("COMMA\n");}
"("                  {printf("L_PAREN\n");}
")"                  {printf("R_PAREN\n");}
"["                  {printf("L_SQUARE_BRACKET\n");}
"]"                  {printf("R_SQUARE_BRACKET\n");}
":="                 {printf("ASSIGN\n");}

/*comments, newline, tabs */
"##".*               {printf("");}
"\n"                 {printf(");}
              

/* still have to implement two types of erros + counting lines and columns */

.                    {printf("Error, unrecognized symbol); exit(0);}

%%
	/* C functions used in lexer */

int main(int argc, char ** argv)
{
   yylex();
}
