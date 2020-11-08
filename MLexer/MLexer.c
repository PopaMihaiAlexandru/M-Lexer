#include <stdio.h>
#include "symbols.h"

//extern int yylex(void);
extern int yyparse(void);
extern FILE* yyin;
extern int yydebug;
char* symbols[] = { "END",
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
							"GT",
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
	//int tokenValue = 0;
	//yydebug = 1;
	yyin = fopen("input.csrc", "rt");
	if (yyin != NULL)
	{
		int result = yyparse();
		switch (result)
		{
		case 0:
			printf("Parse successfull.\n");
			break;

		case 1:
			printf("Invalid input encountered\n");
			break;

		case 2:
			printf("Out of memory\n");
			break;

		default:
			break;
		}
		/*while ((tokenValue = yylex()) != END)
		{
			printf(" -> TOKEN ID: %d; Token Value: %s \n", tokenValue, lexUnits[tokenValue]);
		}*/
		fclose(yyin);
	}
	else
	{
		printf("Fisier inexistent");
	}

}

