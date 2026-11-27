/*
 * 
 *
 */


#include <stdio.h>
#include <stdlib.h>

#include "FreeRTOS.h"
#include "task.h"


/* Called by the kernel when a task stack overflow is detected
 * (configCHECK_FOR_STACK_OVERFLOW is enabled in FreeRTOSConfig.h). */
void vApplicationStackOverflowHook(TaskHandle_t xTask, char *pTaskName)
{
    (void)xTask;
    printf("Stack overflow in task: %s\n", pTaskName);
    abort();
}

int main() {

    //xTaskCreate();
    //xTaskCreate();
    //xTaskCreate();
    //xTaskCreate();

}
