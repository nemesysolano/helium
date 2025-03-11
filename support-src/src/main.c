#include <stdio.h>
#include "support.h"
int main() {
    printf("Support Library Tests\n");
    print_float(3.141529, 12, 6);
    print_bigint(1234567890);
    return 0;
}