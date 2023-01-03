// C program to implement
// the above approach
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 

int main()
{
    unsigned long num1;
    unsigned long num2;
    unsigned long result;
    FILE *myFile;
    myFile = fopen("/sys/class/powercap/intel-rapl/intel-rapl:0/energy_uj", "rb");

  // display numbers
  num1 = getw(myFile);
  //num2 = num1 / 10000000;
  printf("(runfile-Micro Joules: %lu\n", num1);

//char enter = 0;
//while (enter != '\r' && enter != '\n') { enter = getchar(); }

  //num2 = getw(myFile);
  //printf("%lf\n", num2);

  //result =  num2 - num1;
  
  //printf("%lf\n", result); 

  
  // close connection
  //fclose(myFile);
  
  return 0;

}
