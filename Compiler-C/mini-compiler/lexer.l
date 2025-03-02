%{
#include "parser.tab.h" 
%}

%%
[ \t\r\n]+    ;       
[0-9]+        { yylval.val = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.name = strdup(yytext); return IDENTIFIER; }
"="           { return '='; }
"+"           { return '+'; }
"-"           { return '-'; }
"*"           { return '*'; }
"/"           { return '/'; }
";"           { return ';'; }
.             { printf("Caractère inconnu: %s\n", yytext); exit(1); }
%%
