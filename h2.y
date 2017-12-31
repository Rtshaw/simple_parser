%token Number Add Sub Mul Div LB RB FD
%{
    #include <stdio.h>
    extern void yyerror(char*); 
%}

%left Add Sub
%left Mul Div
%right uminus

%%
statement : expression { printf("\nAns is %d\n\n========\n", $1); }
          | expression FD { printf("\nAns is %d\n\n========\n", $2); }
          | statement expression { printf("\nAns is %d\n\n========\n", $2); }
          | statement expression FD { printf("\nAns is %d\n\n========\n", $2); }
          ;
expression : expression Add terminal { printf("%d add %d is %d\n", $1, $3, $$ = $1 + $3); }
           | expression Sub terminal { printf("%d sub %d is %d\n", $1, $3, $$ = $1 - $3); }
           | Sub expression %prec uminus { $$ = -$2; }
           | expression Mul terminal { printf("%d mul %d is %d\n", $1, $3, $$ = $1 * $3); }
           | expression Div terminal { if($3 == 0){ $$ = 0;
                                       yyerror("Dividends can't be zero.");
                                     }
                                     else {
                                       printf("%d div %d is %d\n", $1, $3, $$ = $1 / $3);
                                     }
                                   }
           | terminal { $$ = $1; }
           ;
terminal : Number { $$ = $1; }
         | factor { $$ = $1; }
         ;
factor : LB expression RB { $$ = $2; }
       ;
%%

int main() { 
    yyparse();
    return 0;
}

void yyerror(char* msg) {
    printf("Error:%s \n", msg);
}
