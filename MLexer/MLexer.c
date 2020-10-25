#include <stdio.h>
#include "symbols.h"
#include <errno.h>

extern FILE* yyin;
extern int yylex(void);
const char* lexUnits[] = { "END",
							"AND",
							"SUB",
							"MUL",
							"DIV",
							"ASSIGN",
							"AND",
							"OR",
							"NOT",
							"EQUAL",
							"LT",
							"RT",
							"LE",
							"GE",
							"LPAR",
							"RPAR",
							"CLPAR",
							"CRPAR",
							"SLPAR",
							"SRPAR", 
							"COLON", 
							"SEMICLON",
							"COMMA",
							"IF",
							"THEN",
							"WHILE",
							"DO",
							"READ",
							"ELSE",
							"BEGIN",
							"PRINT",
							"INT",
							"BOOL",
							"REAL",
							"VAR",
							"SIZE",
							"FLOAT",
							"FLOOR",
							"CEIL",
							"FUN",
							"RETURN",
							"IVAL",
							"RVAL",
							"BVAL",
							"ID" };

int main()
{
	int tokenValue = 0;
	yyin = fopen("input.csrc", "rt");
	if (yyin != NULL)
	{
		while ((tokenValue = yylex()) != END)
		{
			printf(" -> TOKEN ID: %d; Token Value: %s \n", tokenValue, lexUnits[tokenValue]);
		}
	}
	else
	{
		printf("Fisierul de intrare nu poate fi deschis. Erorare: %d", errno);
	}


}

