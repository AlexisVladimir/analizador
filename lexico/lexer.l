%{
#include <stdio.h>
#include <iostream>
#include "parser.tab.h"


int currentLine = 1;

void printError(const char* errorMessage, const char* invalidChar) {
    std::cerr << errorMessage << " en la línea " << currentLine << ": Caracter desconocido '" << invalidChar << "'" << std::endl;

    }
%}

%option noyywrap
%option c++ 
%option case-insensitive 


DIGITO [0-9]
LETRAS [a-zA-Z_]
IDENTIFICADOR {LETRAS}({LETRAS}|{DIGITO})*
NUM {DIGITO}+
SINGLE_QUOTE  '\''
PUNTO     \.
LCORCHETE   \[
RCORCHETE  \]

%%

"if"            { return IF; }
"else"          { return ELSE; }
"while"         { return WHILE; }
"do while"      { return DOWHILE; }
"for"           { return FOR; }
"return"        { return RETURN; }

"int"           { return INT; }
"char"          { return CHAR; }
"float"         { return FLOAT; }
"boolean"       { return BOOLEAN; }

"+"|"-"|"*"|"/" { return OPERADORES; }
"="             { return ASIGNACION; }
";"             { return PUNTOCOMA; }
"<"|">"|"!"     {return OPERADORESLOGICOS;}

{SINGLE_QUOTE}  { return SINGLE_QUOTE; }
{NUM}           { return NUM; }
{IDENTIFICADOR} { return IDENTIFICADOR; }

"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LLLAVE; }
"}"             { return RLLAVE; }
"'"             { return SINGLE_QUOTE; }
\"              { return DOUBLE_QUOTE;}


{PUNTO}         { return PUNTO; }
{LCORCHETE}     { return LCORCHETE; }
{RCORCHETE}     { return RCORCHETE; }

[ \t]           { }
\n              { currentLine++; }

.               { std::cerr << "Error: Caracter desconocido '" << yytext << "'" << std::endl; }


%%




