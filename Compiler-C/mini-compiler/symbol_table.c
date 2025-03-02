#include "symbol_table.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

Symbol symbols[100];
int sym_count = 0;

int lookup_symbol(char *name) {
  for (int i = 0; i < sym_count; i++) {
    if (strcmp(symbols[i].name, name) == 0) {
      return symbols[i].value;
    }
  }
  printf(" Error: variable no detected %s\n", name);
  exit(1);
}

void store_symbol(char *name, int value) {
  for (int i = 0; i < sym_count; i++) {
    if (strcmp(symbols[i].name, name) == 0) {
      symbols[i].value = value;
      return;
    }
  }
  symbols[sym_count].name = strdup(name);
  symbols[sym_count].value = value;
  sym_count++;
}

void generate_code(char *name, int value) {
  printf("MOV %s, %d\n", name, value);
}
