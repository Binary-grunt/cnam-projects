EXEC = mini_compilateur

LEXER = lexer.l
PARSER = parser.y
SRC = main.c

LEXER_C = lexer.c
PARSER_C = parser.c
PARSER_H = parser.tab.h

OBJ = lexer.o parser.o main.o

CC = gcc
LEX = flex
YACC = bison

all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) -o $(EXEC) $(OBJ) -lfl

$(PARSER_C) $(PARSER_H): $(PARSER)
	$(YACC) -d -o $(PARSER_C) $(PARSER)

$(LEXER_C): $(LEXER) $(PARSER_H)
	$(LEX) -o $(LEXER_C) $(LEXER)

lexer.o: $(LEXER_C)
	$(CC) -c $(LEXER_C)

parser.o: $(PARSER_C)
	$(CC) -c $(PARSER_C)

main.o: $(SRC)
	$(CC) -c $(SRC)

clean:
	rm -f $(EXEC) $(OBJ) $(LEXER_C) $(PARSER_C) $(PARSER_H)

rebuild: clean all
