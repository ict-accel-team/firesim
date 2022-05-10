#include <stdio.h>
#include "util.h"
#include "printu.h"
int add(){
  return 3+4;
}

int main(void)
{
  printu("Hello World\n");
  //stats(add(),10);
  printu("mcycle:%x",read_csr(mcycle));
  sizeof(size_t);
	return 0;
}
