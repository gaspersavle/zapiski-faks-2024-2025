#include <stdio.h>
#include <stdlib.h>
#include "fibonacci.h"

int main()
{
  int n;
  printf("Enter the number of terms: ");
  scanf("%d", &n);

  int* result = fibonacci(n);

  if(result==NULL)
  {
    fprintf(stderr, "invalid input\n");
    return 1;
  }

  printf("Fibonacci sequence:\n");
  for(int i=0; i<n; i++)
  { 
    printf("%d, ",result[i]);
  }

  printf("\n");
  free(result);
  
  return 0;
}

