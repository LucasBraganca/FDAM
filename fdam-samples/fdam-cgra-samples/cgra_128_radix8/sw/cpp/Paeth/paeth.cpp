#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <omp.h>

using namespace std;
using namespace std::chrono;

#define DATA_SIZE (1 << 24)
#define NUM_THREAD 8

int paeth(int idx);
int paeth_openmp(int idx);

int main(int argc, char *argv[]){
      
     int idx = 0;
     if(argc > 1)
        idx = atoi(argv[1]);
   
     paeth(idx);
     paeth_openmp(idx);
     
     return 0;
}

int paeth(int idx){

   unsigned short *a, *b, *c, *out;
   
   a = new unsigned short[DATA_SIZE];
   b = new unsigned short[DATA_SIZE];
   c = new unsigned short[DATA_SIZE];
   out = new unsigned short[DATA_SIZE];

   for (int k = 0; k < DATA_SIZE; ++k) {
      a[k] = k % 1024;
      b[k] = k % 1024;
      c[k] = k % 1024;
      out[k] = 0;
   }   

   high_resolution_clock::time_point s;
   duration<double> diff = {};
   for(int i=0;i<100;i++){
      s = high_resolution_clock::now();
      for (int k = 0; k < DATA_SIZE; ++k) {
                int pas, pbs, pcs;
                bool test_1, test_2, test_3, test_4;
                pas = b[k] - c[k];
                pbs = a[k] - c[k];
                pcs = a[k] | (b[k] - 2 * c[k]);
                test_1 = abs(pas) <= abs(pbs);
                test_2 = abs(pas) <= abs(pcs);
                test_4 = abs(pbs) <= abs(pcs);
                test_3 = test_1 && test_2;
                if (test_3) out[k] = a[k];
                else if (test_4) out[k] = b[k];
                else out[k] = c[k];
      }
      diff += high_resolution_clock::now() - s;
   }
   double cpuExecTime = (diff.count() * 1000)/100; 

   printf("Time(ms) 1 Thread: %5.2lf\n",cpuExecTime);
   
   int v = out[idx];  

   delete a;
   delete b;
   delete c;
   delete out;

  return v;
  
}

int paeth_openmp(int idx){

   unsigned short *a, *b, *c, *out;
   
   a = new unsigned short[DATA_SIZE];
   b = new unsigned short[DATA_SIZE];
   c = new unsigned short[DATA_SIZE];
   out = new unsigned short[DATA_SIZE];

   for (int k = 0; k < DATA_SIZE; ++k) {
      a[k] = k % 1024;
      b[k] = k % 1024;
      c[k] = k % 1024;
      out[k] = 0;
   }    
   omp_set_num_threads(NUM_THREAD);
   high_resolution_clock::time_point s;
   duration<double> diff = {};
   for(int i=0;i<100;i++){
      s = high_resolution_clock::now();
#pragma omp parallel
#pragma omp for 
      for (int k = 0; k < DATA_SIZE; ++k) {
                int pas, pbs, pcs;
                bool test_1, test_2, test_3, test_4;
                pas = b[k] - c[k];
                pbs = a[k] - c[k];
                pcs = a[k] | (b[k] - 2 * c[k]);
                test_1 = abs(pas) <= abs(pbs);
                test_2 = abs(pas) <= abs(pcs);
                test_4 = abs(pbs) <= abs(pcs);
                test_3 = test_1 && test_2;
                if (test_3) out[k] = a[k];
                else if (test_4) out[k] = b[k];
                else out[k] = c[k];       
      }
      diff += high_resolution_clock::now() - s;
   }
   double cpuExecTime = (diff.count() * 1000)/100; 

   printf("Time(ms) %d Thread: %5.2lf\n",NUM_THREAD,cpuExecTime);

   int v = out[idx];  

   delete a;
   delete b;
   delete c;
   delete out;

  return v;
}

