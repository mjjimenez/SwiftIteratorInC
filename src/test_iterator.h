#include <stdbool.h>

typedef void (*iterator)(void *ctxt, bool *itertorEnd, float *training_data, float *labels);
typedef void (*iteratorDest)(void *ctxt);


void test_iterator(void *ctxt, iterator iter, iteratorDest destructor);

void test_print(void);
