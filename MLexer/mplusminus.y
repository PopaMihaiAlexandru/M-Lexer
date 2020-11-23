%{
#include <stdio.h>
#include "ast.h"

Node* astRoot = NULL;
int yyerror(char * s);
extern int yylex(void);

%}
%union{
	
	Node *node;
	char* strings;
	int intVal;
	bool boolVal;
}
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
%token BEGINKEY
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
%token <intVal> IVAL
%token <intVal> RVAL
%token BVAL
%token <strings> ID

%type <node> prog
%type <node> block
%type <node> declarations
%type <node> declaration
%type <node> var_declaration
%type <node> type
%type <node> array_dimensions
%type <node> fun_declaration
%type <node> fun_block
%type <node> param_list
%type <node> parameters
%type <node> more_parameters
%type <node> basic_declaration
%type <node> basic_array_dimensions
%type <node> program_body
%type <node> fun_body
%type <node> prog_stmts
%type <node> prog_stmt
%type <node> identifier
%type <node> expr
%type <node> bint_term
%type <node> bint_factor
%type <node> compare_op
%type <node> int_expr
%type <node> addop
%type <node> int_term
%type <node> mulop
%type <node> int_factor
%type <node> modifier_list
%type <node> arguments
%type <node> more_arguments

%start prog
%%
prog
	: block { $$ = createProgramUnitNode($1); astRoot = $$;}
	;

block
	: declarations program_body 
	;

declarations
	: declaration SEMICLON declarations 
	|
	;

declaration
	: var_declaration {$$ = createDeclarationNode($1);}
	| fun_declaration {$$ = createDeclarationNode($1);}
	;

var_declaration
	: VAR ID array_dimensions COLON type { $$ = createVarDeclaration($5, $2, $3);}
	;

type
	: INT {$$ = createTypeSpecifier("INT");}
	| REAL {$$ = createTypeSpecifier("REAL");}
	| BOOL {$$ = createTypeSpecifier("BOOL");}
	;

array_dimensions
	: SLPAR expr SRPAR array_dimensions 
	|
	;

fun_declaration
	: FUN ID param_list COLON type CLPAR fun_block CRPAR { $$ = createFunctionDeclarationNode($5, $2, $3, $7);  }
	;

fun_block 
	: declarations fun_body {$$ = createCompoundStatement($1, $2);}
	;

param_list
	: LPAR parameters RPAR { $$ = createListNode("ParameterList", $2); }
	;

parameters
	: basic_declaration more_parameters 
	|
	;

more_parameters
	: COMMA basic_declaration more_parameters 
	|
	;

basic_declaration
	: ID basic_array_dimensions COLON type { $$ = createVarDeclaration($4, $1, $2);}
	;

basic_array_dimensions
	: SLPAR SRPAR basic_array_dimensions
	|
	;

program_body
	: BEGINKEY prog_stmts END
	;

fun_body
	: BEGINKEY prog_stmts RETURN expr SEMICLON END
	;

prog_stmts
	: prog_stmt SEMICLON prog_stmts 
	|
	;

prog_stmt
	: IF expr THEN prog_stmt ELSE prog_stmt { $$ = createIfStatement("If", $3, $5);}
	| WHILE expr DO prog_stmt { $$ = createWhileStatement("While", $3);}
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

int yyerror(char * s) 
/* yacc error handler */
{    
	printf ( "%s\n", s); 
	return 0;
}  