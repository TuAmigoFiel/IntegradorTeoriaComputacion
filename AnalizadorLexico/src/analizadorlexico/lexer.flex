package analizadorlexico;
/* Declaraciones de código */
%{
  import java_cup.runtime.Symbol;
%}

/* Configuración del analizador léxico */
%class Lexer
%unicode
%cup
%public
%type Symbol
%line
%column

/* Definición de estados */
%{
  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn, yytext());
  }
%}

/* Definiciones de patrones */
DIGIT = [0-9]
LETTER = [a-zA-Z]
WHITESPACE = [ \t\r\n]+

%%

/* Reglas léxicas */
<YYINITIAL> {
  "programa"       { return symbol(sym.PROGRAMA); }
  "variables"      { return symbol(sym.VARIABLES); }
  "funcion"        { return symbol(sym.FUNCION); }
  "inicio"         { return symbol(sym.INICIO); }
  "si"             { return symbol(sym.SI); }
  "entonces"       { return symbol(sym.ENTONCES); }
  "sino"           { return symbol(sym.SINO); }
  "fin"            { return symbol(sym.FIN); }
  "entero"         { return symbol(sym.ENTERO); }
  "leer"           { return symbol(sym.LEER); }
  "escribir"       { return symbol(sym.ESCRIBIR); }
  
  "("              { return symbol(sym.LPAREN); }
  ")"              { return symbol(sym.RPAREN); }
  ","              { return symbol(sym.COMMA); }
  ";"              { return symbol(sym.SEMICOLON); }
  ":="             { return symbol(sym.ASSIGN); }
  ":"              { return symbol(sym.COLON); }
  
  {DIGIT}+         { return symbol(sym.NUMBER); }
  {LETTER}({LETTER}|{DIGIT}|"_")* { return symbol(sym.IDENTIFIER); }
  
  {WHITESPACE}     { /* Ignorar espacios en blanco */ }
  
  .                { System.err.println("Caracter no reconocido: " + yytext()); }
}
