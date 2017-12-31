%{
#include "y.tab.h"
%}

%option noyywrap

Number     [0-9][0-9]*

%%
{Number}     { yylval = atoi(yytext); return(Number);}
"+"          { return(Add);}
"-"          { return(Sub);}
"*"          { return(Mul);}
"/"          { return(Div);}
"("          { return(LB);}
")"          { return(RB);}
" "          {}
\r\n         { return(FD); }
\n           { return(FD); }
.            { return yytext[0]; }
%%
