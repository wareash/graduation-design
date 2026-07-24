# STM32 + FPGA 数字音频处理系统

> **状态：本科毕业设计档案，已停止维护。** 项目完成于 2015 年前后，保留论文、FPGA 工程、STM32 程序、仿真文件与阶段性构建产物，主要用于展示当时的系统设计与工程实现。

## 项目概述

系统由 STM32 负责音频读取与控制，FPGA 负责 FFT、FIR、SPI、PWM 等实时数字信号处理模块，实现音频采集、频谱分析、均衡、变调、播放与显示。

## 技术栈

- STM32 / C
- FPGA / VHDL / Verilog
- FFT、FIR 与数字音频处理
- SPI、PWM、SD 卡与显示模块
- MATLAB 与 HDL 仿真

## 历史环境说明

工程包含旧版 Quartus/IP 生成文件和大量构建产物，未验证对现代工具链的兼容性。复现前需要根据目标 FPGA、STM32 型号和对应版本的厂商工具重新配置。

## Original Abstract

This design analyzes various digital audio processing structures, including constitutions, principles and characteristics.

Since most of these products have complex structures, limited functionality and other shortcomings on the market, we propose a new system with wildly used advanced STM32 processor which captures digital audio, and a FPGA chip which processes them. 

It is discussed in detail that the digital audio capturing, processing system software, hardware design ideas and methods of the circuit. The key module of the designation are: STM32 processor and peripheral circuits, SPI bus controller, FFT module, FIR module, PWM controllers, digital power amplifier and a display section. C programming language is used to operate the STM32 system to read MP3 files on the SD card, and after setting the STM32 as a SPI master, HDL hardware circuitry is used to generate the core modules, including audio data acquisition, data processing module, display controller, output modules. The proposed system achieves a real-time analysis of the audio balance, transformation, transposition, playback and other functions, and it is a better solution of digital audio equalization, modulation, digital power amplifier and other issues.
