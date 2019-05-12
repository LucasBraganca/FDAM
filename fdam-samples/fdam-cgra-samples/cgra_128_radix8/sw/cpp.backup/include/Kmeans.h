//
// Created by lucas on 31/01/19.
//

#ifndef MAIN_KMEANS_H
#define MAIN_KMEANS_H

#include <chrono>
#include <fdam/cgra/cgra.h>
#include <fdam/cgra/data_flow.h>
#include <fdam/cgra/cgra_arch.h>
#include <fdam/cgra/scheduler.h>
#include <fdam/cgra/scheduler_defs.h>
#include <conf.h>

using namespace std::chrono;

class Kmeans {
private:
    Cgra *cgraHw;
    CgraArch *cgraArch;
    int num_clusters;
    int num_dim;
    double schedulingTime;
    double cpuExecTime;
    double cgraExecTime;
    double cgraConfTime;

    void helpKmeansUpdateCentroids(unsigned short ***data_in, unsigned short **data_out, unsigned short **centroids,
                                   unsigned short **centroids_old, int data_size, int numThreads);

    void helpKmeansUpdateConstants(cgra_program_t *cgra_program, int thread, unsigned short *constants);

    void runCGRA(unsigned short ***data_in, unsigned short **data_out, unsigned short **centroids, int data_size,
                 int numThread);

    void runCPU(unsigned short ***data_in, unsigned short **data_out, unsigned short **centroids, int data_size,
                int numThread);

    static bool compare(Operator *a, Operator *b);

public:

    Kmeans(Cgra *cgra, CgraArch *cgraArch, int num_dim, int num_clusters);

    ~Kmeans();

    DataFlow *createDataFlow(int id);

    void benchmarking(int numThreads, int data_size);

    void printStatistics();

    bool compile(int numThreads);

};


#endif //MAIN_KMEANS_H