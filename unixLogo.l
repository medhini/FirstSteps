%{
#include <stdio.h>
#include "y.tab.h"
int c;
extern int yylval;
%}
%%
MOVE|move		return MOVE;
LT|lt			return LEFT;
RT|rt			return RIGHT;
FD|fd			return FORWARD;
BK|bk			return BACKWARD;
PEN|pen			return PEN;
UP|up			return UP;
DOWN|down		return DOWN;
SIZE|size		return SIZE;
COLOR|color		return COLOR; 
ERASE|erase		return ERASE;
NORMAL|normal		return NORMAL;	
SHOW|show		return SHOW;
HIDE|hide		return HIDE;
TURTLE|turtle		return TURTLE;
EXIT|exit		return EXIT;
ROTATE|rotate 		return ROTATE;
HOME|home		return HOME;
CLEARSCREEN|clearscreen return CLEARSCREEN;
SQUARE|square		return SQUARE;
CIRCLE|circle 		return CIRCLE;
[0-9]   		{
			 c=((int)yytext[0]-48);
			 yylval=c;
			 return VA;
			}
[0-9][0-9]   		{
			 c=((int)yytext[0]-48)*10+((int)yytext[1]-48);
			 yylval=c;
			 return VALUE;
			}
[0-3][0-9][0-9]   		{
			 c=((int)yytext[0]-48)*100+((int)yytext[1]-48)*10+((int)yytext[2]-48);
			 yylval=c;
			 return VAL;
			}
	
\n                      /* ignore end of line */;
[ \t]+                  /* ignore whitespace */;
%%
