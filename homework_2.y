%token Number Add Sub Mul Div
%{
    #include <stdio.h>
    extern void yyerror(char*); 
%}

%left Add Sub
%left Mul Div
%right uminus

%%
statement : expression '\n'         { printf("Ans is %d\n\n========\n", $1); }
          | statement expression '\n'    { printf("Ans is %d\n\n========\n", $2); }
          ;
expression : '(' expression ')'      { $$ = $2; }
           | expression Add expression     { printf("%d add %d is %d\n", $1, $3, $$ = $1 + $3); }
           | expression Sub expression     { printf("%d sub %d is %d\n", $1, $3, $$ = $1 - $3); }
           | expression Mul expression     { printf("%d mul %d is %d\n", $1, $3, $$ = $1 * $3); }
           | expression Div expression     { printf("%d div %d is %d\n", $1, $3, $$ = $1 / $3); }
           | Sub expression %prec uminus { $$ = -$2; }
           | Number
           ;
%%

int main() { 
    yyparse();
    return 0;
}

void yyerror(char* msg) {
    printf("Error:%s \n", msg);
}