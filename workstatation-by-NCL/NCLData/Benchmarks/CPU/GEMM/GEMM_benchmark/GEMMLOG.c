// C program to implement
// the above approach
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 

int main()
{
    double num1;
    double num2;
    double result;
    FILE *myFile;
    myFile = fopen("/sys/class/powercap/intel-rapl/intel-rapl:0/energy_uj", "rb");

  // display numbers
  num1 = getw(myFile);
  printf("%lf\n", num1);

char enter = 0;
while (enter != '\r' && enter != '\n') { enter = getchar(); }

  num2 = getw(myFile);
  printf("%lf\n", num2);

  result =  num2 - num1;
  
  printf("%lf\n", result); 

  
  // close connection
  fclose(myFile);
  
  return 0;

}
