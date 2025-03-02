%{
#include <stdio.h>
#include <stdlib.h>
#include "symbol_table.h"

int yylex(); 
void yyerror(const char *s); 
%}

%union {
    int val;
    char *name;
}

%token <val> NUMBER
%token <name> IDENTIFIER
%type <val> expr

%left '+' '-'
%left '*' '/'

%%
program:
    program statement
    | statement
    ;

statement:
    IDENTIFIER '=' expr ';' {
        store_symbol($1, $3);
        generate_code($1, $3);
    }
    ;

expr:
    NUMBER { $$ = $1; }
    | IDENTIFIER { $$ = lookup_symbol($1); }
    | expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr {
        if ($3 == 0) {
            yyerror("Division par zéro !");
            exit(1);
        }
        $$ = $1 / $3;
    }
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Erreur : %s\n", s);
}

int yywrap() { return 1; }

int main() {
    printf("Mini-compilateur démarré. Tapez vos instructions :\n");
    yyparse();
    return 0;
}
