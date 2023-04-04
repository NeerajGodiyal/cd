//IN THE TERMINAL
%{

%}

space [\t]
emptyline [\n]

%%
{space}+ printf(" ");
{emptyline}+ printf("\n");
[$] return 0;
%%

yywrap(){}
int main(int argc, char *argv[])
{
extern FILE *yyin;
yyin=fopen("Input.txt","r");
yylex();
return 0;
}


//IN AN OUTPUT FILE
%{
%}
%%
[\n\t]+ fprintf(yyout," ");
. fprintf(yyout,"%s",yytext);
%%
yywrap(){}
main()
{
extern FILE *yyin,*yyout;
yyin=fopen("Input.txt","r");
yyout=fopen("Output.txt","w");
yylex();
return 0;
}
