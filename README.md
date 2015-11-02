#ABSTRACT
This design analyzes various digital audio processing structures, including constitutions, principles and characteristics.

Since most of these products have complex structures, limited functionality and other shortcomings on the market, we propose a new system with wildly used advanced STM32 processor which captures digital audio, and a FPGA chip which processes them. 

It is discussed in detail that the digital audio capturing, processing system software, hardware design ideas and methods of the circuit. The key module of the designation are: STM32 processor and peripheral circuits, SPI bus controller, FFT module, FIR module, PWM controllers, digital power amplifier and a display section. C programming language is used to operate the STM32 system to read MP3 files on the SD card, and after setting the STM32 as a SPI master, HDL hardware circuitry is used to generate the core modules, including audio data acquisition, data processing module, display controller, output modules. The proposed system achieves a real-time analysis of the audio balance, transformation, transposition, playback and other functions, and it is a better solution of digital audio equalization, modulation, digital power amplifier and other issues.
