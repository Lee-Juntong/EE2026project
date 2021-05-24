# FPGA Sound Display and Entertainment (SDE) System
EE2026 Digital Design final project by @Lee-Juntong and @zikunz.

## Background and Objectives
This project involves programming a Digilent’s Basys 3 development board (with an additional PmodMIC3 as audio input and
an additional PmodOLEDrgb as image output) using Verilog. The software used to design, synthesise, simulate and
implement the program is Vivado 2018.2.

## Main Features
The main features of the system include basic display of audio signal on the Organic Light-Emitting Diode (OLED) screen
given (Microphone–Basys 3–OLED interfacing), real-time audio volume indicator(Microphone–Basys 3 interfacing), graphical
visualisations and configurations (OLED–Basys 3 interfacing) and **five** improvement features. We invite you to read
`EE2026_Report_GitHub_version` for more details regarding this project.

## Testing and Development
1. Open `SoundDisplay.xpr` found in `SoundDisplay` folder with Vivado 2018.2. <br>
2. Connect Basys 3 development board to your computer, program it. <br>
2. In the `Flow Navigator` window, under `SYNTHESIS`, select `Run Synthesis`.
3. In the `Flow Navigator` window, under `IMPLEMENTATION`, select `Run Implementation`.
4. In the `Flow Navigator` window, under `PROGRAM  AND  DEBUG`,  select `Generate  Bitstream`.

