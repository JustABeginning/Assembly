#include <stdint.h>
#include <stdio.h>

extern uint8_t printme_arr[];
extern uint32_t printme_len;

void display(uint8_t *, uint32_t);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wimplicit-function-declaration"

int main() {
  printf("\nprintme_arr :=>\n");
  display(printme_arr, printme_len);
  printf("\nprintme_len = %u\n\n", printme_len);
  return 0;
}

void display(uint8_t *arr, uint32_t l) {
  printf("\n");
  for (uint32_t i = 0; i < l; i++)
    printf("%X ", arr[i]);
  printf("\n");
}

#pragma clang diagnostic pop
