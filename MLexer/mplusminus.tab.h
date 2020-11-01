/* A Bison parser, made by GNU Bison 3.7.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_MPLUSMINUS_TAB_H_INCLUDED
# define YY_YY_MPLUSMINUS_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    END = 258,                     /* END  */
    ADD = 259,                     /* ADD  */
    SUB = 260,                     /* SUB  */
    MUL = 261,                     /* MUL  */
    DIV = 262,                     /* DIV  */
    ASSIGN = 263,                  /* ASSIGN  */
    AND = 264,                     /* AND  */
    OR = 265,                      /* OR  */
    NOT = 266,                     /* NOT  */
    EQUAL = 267,                   /* EQUAL  */
    LT = 268,                      /* LT  */
    GT = 269,                      /* GT  */
    LE = 270,                      /* LE  */
    GE = 271,                      /* GE  */
    LPAR = 272,                    /* LPAR  */
    RPAR = 273,                    /* RPAR  */
    CLPAR = 274,                   /* CLPAR  */
    CRPAR = 275,                   /* CRPAR  */
    SLPAR = 276,                   /* SLPAR  */
    SRPAR = 277,                   /* SRPAR  */
    COLON = 278,                   /* COLON  */
    SEMICLON = 279,                /* SEMICLON  */
    COMMA = 280,                   /* COMMA  */
    IF = 281,                      /* IF  */
    THEN = 282,                    /* THEN  */
    WHILE = 283,                   /* WHILE  */
    DO = 284,                      /* DO  */
    READ = 285,                    /* READ  */
    ELSE = 286,                    /* ELSE  */
    BEGIN = 287,                   /* BEGIN  */
    PRINT = 288,                   /* PRINT  */
    INT = 289,                     /* INT  */
    BOOL = 290,                    /* BOOL  */
    REAL = 291,                    /* REAL  */
    VAR = 292,                     /* VAR  */
    SIZE = 293,                    /* SIZE  */
    FLOAT = 294,                   /* FLOAT  */
    FLOOR = 295,                   /* FLOOR  */
    CEIL = 296,                    /* CEIL  */
    FUN = 297,                     /* FUN  */
    RETURN = 298,                  /* RETURN  */
    IVAL = 299,                    /* IVAL  */
    RVAL = 300,                    /* RVAL  */
    BVAL = 301,                    /* BVAL  */
    ID = 302                       /* ID  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_MPLUSMINUS_TAB_H_INCLUDED  */
