arm-none-eabi-gcc -mcpu=cortex-m33 -O3 -ffunction-sections -fdata-sections -Wall -Wextra -g3 -DARMCM33_DSP_FP_TZ  -DOS_USE_SEMIHOSTING  -I"../system/include" -I"../system/include/cmsis" -std=gnu11 -c -o "sbrk.o" "../system/src/newlib/sbrk.c"
 
arm-none-eabi-gcc -mcpu=cortex-m33 -O3 -ffunction-sections -fdata-sections -Wall -Wextra -g3 -DARMCM33_DSP_FP_TZ  -DOS_USE_SEMIHOSTING  -I"../system/include" -I"../system/include/cmsis" -std=gnu11 -c -o "startup.o" "../system/src/newlib/startup.c"
 
arm-none-eabi-gcc -mcpu=cortex-m33 -O3 -ffunction-sections -fdata-sections -Wall -Wextra -g3 -DARMCM33_DSP_FP_TZ  -DOS_USE_SEMIHOSTING  -I"../system/include" -I"../system/include/cmsis" -std=gnu11 -c -o "ssyscalls.o" "../system/src/newlib/syscalls.c"

arm-none-eabi-gcc -mcpu=cortex-m33 -O3 -ffunction-sections -fdata-sections -Wall -Wextra -g3 -DARMCM33_DSP_FP_TZ  -DOS_USE_SEMIHOSTING  -I"../system/include" -I"../system/include/cmsis" -std=gnu11 -c -o "system_ARMCM33.o" "../system/src/cmsis/system_ARMCM33.c"

arm-none-eabi-gcc -mcpu=cortex-m33 -O3 -ffunction-sections -fdata-sections -Wall -Wextra -g3 -DARMCM33_DSP_FP_TZ  -DOS_USE_SEMIHOSTING  -I"../system/include" -I"../system/include/cmsis" -std=gnu11 -c -o "startup_ARMCM33.o" "../system/src/cmsis/startup_ARMCM33.c"

arm-none-eabi-gcc -mcpu=cortex-m33 -O3 -ffunction-sections -fdata-sections -Wall -Wextra -g3 -DARMCM33_DSP_FP_TZ  -DOS_USE_SEMIHOSTING  -I"../system/include" -I"../system/include/cmsis" -std=gnu11 -c -o "main.o" "../src/main.c"


arm-none-eabi-g++ -mcpu=cortex-m33 -O3 -ffunction-sections -fdata-sections -Wall -Wextra -nostartfiles -g3 -T gcc_arm.ld -Xlinker --gc-sections -L"../ldscripts" -Wl,-Map,"hello.map" -o "hello.elf" *.o

qemu-system-arm -machine mps2-an505 -cpu cortex-m33 -nographic --semihosting -kernel hello.elf

rm *.o
