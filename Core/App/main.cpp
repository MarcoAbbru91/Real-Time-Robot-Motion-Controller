#include <cstdio>
#include <cstdlib>

extern "C" {
#include "FreeRTOS.h"
#include "task.h"
}

/* Called by the kernel when a task stack overflow is detected
 * (configCHECK_FOR_STACK_OVERFLOW is enabled in FreeRTOSConfig.h). */
extern "C" void vApplicationStackOverflowHook(TaskHandle_t xTask, char *pTaskName)
{
    (void)xTask;
    std::printf("Stack overflow in task: %s\n", pTaskName);
    std::abort();
}

int main() {

}
