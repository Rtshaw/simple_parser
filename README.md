# simple_parser


```
$flex homework_2.l
$yacc -d homework_2.y

$gcc -c lex.yy -o lex.yy.o
$gcc -c y.tab.c -o y.tab.o

$gcc lex.yy.o y.tab.o -o yacc

$./yacc < test_file.txt
```