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
    uint32_t pool[4];
    for (uint64_t i=1; i<2753321; i++) {
        pool[(i-1)%4]=b;
        //printf("\n%d,%x",i,b);
        if((i-1)%4==3){
            //for (int j=0; j<4; j++) printf("%x,",pool[j]);
            for (int j=0; j<8; j++) {
                if ((pool[0]&(0xf<<j*4))!=(pool[1]&(0xf<<j*4)) && (pool[0]&(0xf<<j*4))!=(pool[2]&(0xf<<j*4)) && (pool[0]&(0xf<<j*4))!=(pool[3]&(0xf<<j*4)) && (pool[1]&(0xf<<j*4))!=(pool[2]&(0xf<<j*4)) && (pool[1]&(0xf<<j*4))!=(pool[3]&(0xf<<j*4)) && (pool[2]&(0xf<<j*4))!=(pool[3]&(0xf<<j*4))) {
                    c2[j]++;
                }
            }
            //printf("\n");
            //for (int j=0; j<8; j++) printf("%llu,",c2[j]);
        }

        b=myrand(b);
        //b=xorshift32(b);
        //b=g1();
    }
    clock_t end   = clock();
    cout << "花费了" << (double)(end - start) / CLOCKS_PER_SEC << "秒" << endl;
    for (int j=0; j<8; j++) printf("%llu,",c2[j]);
}
