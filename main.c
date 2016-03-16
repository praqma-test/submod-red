/**
 * This program requires the following git submodules:
 * - square
 */
#include <stdio.h>
#include <stdlib.h>

#include "square.h"

int main(int argc, char* argv[]) {
  int n = 2;
  if (argc > 1) {
    n = atoi(argv[1]);
  }
  printf("The square of %d is %d\n", n, SQUARE(n)); 
  return 0;
}

