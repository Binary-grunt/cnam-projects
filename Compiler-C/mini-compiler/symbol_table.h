#ifndef SYMBOL_TABLE_H
#define SYMBOL_TABLE_H

typedef struct {
  char *name;
  int value;
} Symbol;

int lookup_symbol(char *name);
void store_symbol(char *name, int value);
void generate_code(char *name, int value);

#endif // SYMBOL_TABLE_H
