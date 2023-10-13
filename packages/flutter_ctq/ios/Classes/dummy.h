#include <stdint.h>
#include <stdlib.h>
#include "ctq_reader.h"

static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;

    // reader
    dummy_var ^= ((int64_t) (void*) ctq_create_reader);
    dummy_var ^= ((int64_t) (void*) ctq_destroy_reader);
    dummy_var ^= ((int64_t) (void*) ctq_find);
    dummy_var ^= ((int64_t) (void*) ctq_get);
    dummy_var ^= ((int64_t) (void*) ctq_writer_version);
    dummy_var ^= ((int64_t) (void*) ctq_reader_version);
    
    return dummy_var;
}