#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <random>
#include <ctime>
#include <iostream>
using namespace std;
uint32_t myrand(uint32_t in)  /* RAND_MAX assumed to be 32767. */
{
    uint32_t next = in * (uint32_t)1103515245 + (uint32_t)12345;
    return(next);
}
uint32_t xorshift32(uint32_t in)
{
  /* Algorithm "xor" from p. 4 of Marsaglia, "Xorshift RNGs" */
  uint32_t x = in;
  x ^= x << 13;
  x ^= x >> 17;
  x ^= x << 5;
  return x;
}

int main(){
    clock_t start = clock();
    //std::mt19937 g1(1);
    uint32_t b=1;
    //uint32_t b=g1();
    uint64_t c2[32]={0};
    uint32_t max;

    max=b;
    for (uint64_t i=1; i<8574833000; i++) {
        //printf("%d,%llu\n",i,b);
            if (b>max) {
                max=b;
            }


        b=myrand(b);
        //b=xorshift32(b);
        //b=g1();
        if (i%16==0) {

            c2[max>>27]++;
            max=b;
            //for (int j=0; j<32; j++) printf("%llu,",c2[j]);
            //printf("\n");
        }

    }
    clock_t end   = clock();
    cout << "花费了" << (double)(end - start) / CLOCKS_PER_SEC << "秒" << endl;
    for (int j=0; j<32; j++) printf("%llu,",c2[j]);
}
