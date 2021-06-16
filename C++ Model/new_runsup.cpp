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
    uint64_t cup=0,cdown=0;
    uint32_t upon=0,downon=0;
    uint32_t last;
    last=1;
    for (uint64_t i=1; i<2753321; i++) {
        //printf("%d,%llu\n",i,b);
        if (b>last) {
            if (upon==0) {
                upon=1;
            }
        }else{
            if (upon) {
                upon=0;
                cup++;
            }
        }
        if (b<last) {
            if (downon==0) {
                downon=1;
            }
        }else{
            if (downon) {
                downon=0;
                cdown++;
            }
        }
        last=b;
        b=myrand(b);
        //b=xorshift32(b);
        //b=g1();

        //printf("%llu\n",c2[0]);



    }
    if (upon) {
        cup++;
    }
    if (downon) {
        cdown++;
    }
    clock_t end   = clock();
    cout << "花费了" << (double)(end - start) / CLOCKS_PER_SEC << "秒" << endl;
    printf("%llu\n",cup+cdown);
    //printf("%llu\n",cdown);
}
