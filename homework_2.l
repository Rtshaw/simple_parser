%{
#include "y.tab.h"
%}

%option noyywrap

Number     [0-9][0-9]*

%%
[\t]+        {}
{Number}     { yylval = atoi(yytext); return(Number);}
"+"          { return(Add);}
"-"          { return(Sub);}
"*"          { return(Mul);}
"/"          { return(Div);}
\n           { return '\n'; }
.            { return yytext[0]; }
%%
