/*
 * C code to take (time, power) from file ($1) and integrate to obtain energy
 * mkbane, Oct2023
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char *argv[]) {
  double energy, width, x, y, meanHeight;  // for each trapezium
  double totalEnergy = 0.0;                 // overall (sum of all trapeziums)

  /*
   * ALGORITHM (trapezium rule, where _0 index is LHS and _1 index is RHS of given trapezium)
   * set totalEnergy as zero
   * read first row as t_0, power_0
   * while (another row)
   *    read next row as t_1, power_1
   *    estimate energy for this trapezium & accumulate into totalEnergy
   *    set t_0 as t_1 and power_0 as power_1 ready for next step
   */

  if (argc != 2) {
    printf("%s requires name of file as sole parameter\n", argv[0]);
  }
  else {
    // open file, get initial row
    FILE* filePtr;
    filePtr = fopen(argv[1], "r"); // open file, given by sole parameter, as read-only
    if (filePtr == NULL) {
      printf("Cannot open file %s\n", argv[1]);
    }
    else {
      char buffer[150];  // for our case we usually have 120 chars per line
      int timeSecs_0, timeNanosecs_0;
      int timeSecs_1, timeNanosecs_1;
      int power_0, power_1;
      // read initial line and parse
      fgets(buffer, BUFSIZ-1, filePtr); // read up to EOL, max of 149 chars
      printf("%s\n", buffer); 
      sscanf(buffer, "%d.%d %d", &timeSecs_0, &timeNanosecs_0, &power_0);
      // loop whilst more rows
      int numPairs = 0;
      double deltaTime, meanPower, partialEnergy;
      while (fgets(buffer, BUFSIZ-1, filePtr) != NULL) {
	numPairs++;
	printf("START: timeSecs=%d, timeNanosecs=%d, power=%d microW\n", timeSecs_0, timeNanosecs_0, power_0);
	sscanf(buffer, "%d.%d %d", &timeSecs_1, &timeNanosecs_1, &power_1);
	printf("FINISH: timeSecs=%d, timeNanosecs=%d, power=%d microW\n", timeSecs_1, timeNanosecs_1, power_1);
	deltaTime = (timeSecs_1 - timeSecs_0) + (double) (timeNanosecs_1 - timeNanosecs_0) * 1.0E-09;
	meanPower = 0.5d * (double) (power_1 + power_0);
	partialEnergy = deltaTime * meanPower;
	printf("Delta time=%f, mean power=%f microWatts ==> partial energy=%f microJoules\n", \
	       deltaTime, meanPower, partialEnergy);
	totalEnergy += partialEnergy;
	printf("Total energy so far: %f\n", totalEnergy);
	// now set RHS to be LHS for any next step
	timeSecs_0 = timeSecs_1;
	timeNanosecs_0 = timeNanosecs_1;
	power_0 = power_1;
      } // while
      printf("Read %d pairs of points.\nTotal energy = %f mJoules\n", numPairs, totalEnergy);
    }
  }
}
