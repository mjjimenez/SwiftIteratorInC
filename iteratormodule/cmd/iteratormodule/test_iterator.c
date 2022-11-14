#include "test_iterator.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

void test_iterator(void *ctxt, iterator iter, iteratorDest destructor) {

    bool iteratorEnd = false;
    while (iteratorEnd == false) {

        float *trainingData = malloc(sizeof(float) * 5);
        float *labels = malloc(sizeof(float) * 1);
        bool iteratorEnd = false;
        iter(ctxt, &iteratorEnd, trainingData, labels);

        if (iteratorEnd == false) {

            // Print training data
            puts("\n training data:");
            for (int i=0; i < 5; i++) {
                printf("%f ", trainingData[i]);
            }

            puts("\n label data:");
            // Print label data
            printf("%f", labels[0]);

            free(trainingData);
            free(labels);

        } else {

            puts("\n iterator is empty");
            free(trainingData);
            free(labels);
            destructor(ctxt);

            break;

        }

    }

}

void test_print(void) {
    puts("hello world");
    printf("value: %d", 3);
}
