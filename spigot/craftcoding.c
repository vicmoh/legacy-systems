#include <stdio.h>
#include <stdlib.h>
 
void spigot();
 
int main(void) {
   spigot();
   return 0;
}
 
void spigot() {
   int i, j, k, q, x;
   int len, nines=0, predigit=0;
   int N=1000;
 
   len = (10*N/3)+1;
   int a[len];
 
   for (i=0; i<len; i=i+1)
      a[i] = 2;
 
   for (j=1; j<=1000; j=j+1) {
      q = 0;
      for (i=len; i>0; i=i-1) {
         x = 10 * a[i-1] + q*i;
         a[i-1] = x % (2*i-1);
         q = x / (2*i-1);
      }
      a[0] = q % 10;
      q = q / 10;
      if (q == 9)
         nines = nines + 1;
      else if (q == 10) {
         printf("%d", predigit+1);
         for (k=0; k<nines; k=k+1)
            printf("%d",0);
         predigit = 0;
         nines = 0;
      }
      else {
         printf("%d", predigit);
         predigit = q;
         if (nines != 0) {
            for (k=0; k<nines; k=k+1)
               printf("%d",9);
            nines = 0;
         }
     }
  }
  printf("%d\n", predigit);
}
