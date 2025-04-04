#include "types.h"
#include "debug.h"
#include <stdio.h>

void trace() {
    size_t content;
    size_t type;
    double number;
    char * text;

    #ifdef __linux__
    __asm__ volatile ("movq %%r10, %0" : "=r" (content));
    __asm__ volatile ("movq %%r11, %0" : "=r" (type));
    #endif    
    
    int integer = (int)content;
    long bigint = (long)content;


    DataType data_type = (DataType)type;
    switch(data_type) {
        case INTEGER:            
            printf(
                "TRACE INTEGER: %c%ld\n", 
                integer < 0 ? '-' : ' ', 
                integer * (integer < 0 ? -1L : 1L)
            );
            break;

        case BIGINT:
            printf(
                "TRACE BIGINT: %c0x%lx\n", 
                bigint < 0 ? '-' : ' ', 
                bigint * (bigint < 0 ? -1L : 1L)
            );
            break;

        case FLOAT:
            number = *(double *)&content;            
            printf("TRACE FLOAT: %14.6lf\n", number);
            break;

        case TEXT:
            text = (char *)content;
            printf("TRACE TEXT: '%s'\n", text);
            break;

        case BOOLEAN:
            printf("TRACE BOOLEAN: %s\n", content != 0 ? "true" : "false");
            break;

        default:
            printf("TRACE <uncharted type>: %ld\n", content);
            break;
    }
}

