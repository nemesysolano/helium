#ifndef __LOG__
#define __LOG__
#include <stdio.h>

#define log() cout << "DEBUG: " << __FUNCTION__ << ' ' << __LINE__ << endl
#define log_message(message) cout << "DEBUG: " << __FUNCTION__ << ' ' << __LINE__ << ' ' << message << endl
#endif