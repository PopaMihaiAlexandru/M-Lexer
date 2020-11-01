%{
#include <stdio.h>
%}

%token END
%token ADD
%token SUB
%token MUL
%token DIV
%token ASSIGN
%token AND
%token OR
%token NOT
%token EQUAL
%token LT
%token GT
%token LE
%token GE
%token LPAR
%token RPAR
%token CLPAR
%token CRPAR
%token SLPAR
%token SRPAR
%token COLON
%token SEMICLON
%token COMMA
%token IF
%token THEN
%token WHILE
%token DO
%token READ
%token ELSE
%token BEGIN
%token PRINT
%token INT
%token BOOL
%token REAL
%token VAR
%token SIZE
%token FLOAT
%token FLOOR
%token CEIL
%token FUN
%token RETURN
%token IVAL
%token RVAL
%token BVAL
%token ID

%start prog
%%
prog
	: block
	| prog block
	;

block
	: declarations
	| program_body 
	;

declarations
	: declaration SEMICLON declarations 
	|
	;

declaration
	: var_declaration
	| fun_declaration
	;

var_declaration
	: VAR ID array_dimensions COLON type
	;

type
	: INT
	| REAL
	| BOOL
	;

array_dimensions
	: SLPAR expr SRPAR array_dimensions 
	|
	;

fun_declaration
	: FUN ID param_list COLON type CLPAR fun_block CRPAR
	;

fun_block 
	: declarations fun_body
	;

param_list
	: LPAR parameters RPAR
	;

parameters
	: basic_declaration 
	| more_parameters 
	|
	;

more_parameters
	: COMMA basic_declaration more_parameters 
	|
	;

basic_declaration
	: ID basic_array_dimensions COLON type
	;

basic_array_dimensions
	: SLPAR SRPAR basic_array_dimensions
	|
	;

program_body
	: BEGIN prog_stmts END
	;

fun_body
	: BEGIN prog_stmts RETURN expr SEMICLON END
	;

prog_stmts
	: prog_stmt SEMICLON prog_stmts 
	|
	;

prog_stmt
	: IF expr THEN prog_stmt ELSE prog_stmt
	| WHILE expr DO prog_stmt
	| READ identifier
	| identifier ASSIGN expr
	| PRINT expr
	| CLPAR block CRPAR
	;

identifier
	: ID array_dimensions
	;

expr
	: expr OR bint_term 
	| bint_term
	;

bint_term
	: bint_term AND bint_factor 
	| bint_factor
	;

bint_factor
	: NOT bint_factor
	| int_expr compare_op int_expr
	| int_expr
	;

compare_op
	: EQUAL
	| LT
	| GT
	| LE
	| GE
	;

int_expr
	: int_expr addop int_term 
	| int_term
	;

addop
	: ADD
	| SUB
	;

int_term
	: int_term mulop int_factor 
	| int_factor
	;

mulop 
	: MUL
	| DIV
	;

int_factor
	: LPAR expr RPAR
	| SIZE LPAR ID basic_array_dimensions RPAR
	| FLOAT LPAR expr RPAR
	| FLOOR LPAR expr RPAR
	| CEIL LPAR expr RPAR
	| ID modifier_list
	| IVAL
	| RVAL
	| BVAL
	| SUB int_factor
	;

modifier_list
	: LPAR arguments RPAR
	| array_dimensions
	;

arguments
	: expr more_arguments 
	|
	;

more_arguments
	: COMMA expr more_arguments
	|
	;

%%

void yyerror(char * s)
{
	printf("%s\n", s);
}