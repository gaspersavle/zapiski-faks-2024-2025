#include <stdio.h>
#include <stdlib.h>

int* fibonacci(const int n)
{
  if(n <=0)
  {
    return NULL;
  }

  int* fiboseq = (int*)malloc(n*sizeof(int));

  if (fiboseq == NULL)
  {
    fprintf(stderr, "malloc failed\n");
    exit(1);  
  }

  fiboseq[0] = 0;

  if (n > 1) 
  {
    fiboseq[1] = 1;
    for (int i = 2; i < n; i++) 
    {
      fiboseq[i] = fiboseq[i - 1] + fiboseq[i - 2];
    }
  }
  return fiboseq;
}

