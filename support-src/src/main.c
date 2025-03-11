#include <stdio.h>
#include "support.h"
int main() {
    printf("Support Library Tests\n");
    print_float(3.141529, 12, 6);
    print_bigint(1234567890);
    print_integer(1234);
    print_bool(1);
    return 0;
}