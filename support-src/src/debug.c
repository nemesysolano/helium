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

    DataType data_type = (DataType)type;
    switch(data_type) {
        case INTEGER:
            printf("TRACE INTEGER: %ld\n", content);
            break;

        case BIGINT:
            printf("TRACE BIGINT: 0x%lx\n", content);
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

/*
__asm__ volatile ("movq %0, %%rax" :: "r" (content));
__asm__ volatile ("movq %0, %%rdi" :: "r" (type));
*/