%{
#include "y.tab.h"
%}

%option noyywrap

Number     [0-9][0-9]*
ID         [a-zA-Z][a-zA-Z0-9]*

%%
{Number}     { yylval = atoi(yytext); return(Number);}
{ID}         { printf("%s = \n", yytext); return(ID);}
"+"          { return(Add);}
"-"          { return(Sub);}
"*"          { return(Mul);}
"/"          { return(Div);}
"("          { return(LB);}
")"          { return(RB);}
"="          { return(Assign);}
" "          {}
\n           { return '\n'; }
.            { return yytext[0]; }
%%
