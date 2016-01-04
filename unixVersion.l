
%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
TOL|tol				return TPLT;
DOL|dol				return DNLT;
TOR|tor				return TPRT;
DOR|dor				return DNRT;

CLEAR|clear			return CLEAR;

RT|rt           		return RIGHT;
LT|lt				return LEFT;
TP|tp				return TOP;
DN|dn				return DOWN;

POS|pos				return POSITION;	

HOME|home			return HOME;		


ERASER|eraser			return ERASER;
PEN|pen				return PEN;
PUP|pup				return PUP;
PDOWN|pdown			return PDOWN;

[0-9]+                   	yylval=atoi(yytext); return STEPS; 
                               
\n                    		/* ignore end of line */;
[ \t]+                  	/* ignore whitespace */;
%%  

