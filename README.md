# Embedded Sensor Monitoring Firmware (Host-Simulated)

A portfolio project in Embedded C demonstrating sensor sampling, fault detection, a UART-style command interface, CSV telemetry logging, and unit tests. It runs on a PC without hardware and is structured for later MCU porting.

> Simulation only. Not certified firmware and not suitable for controlling real hardware.

## Features
- Simulated ADC readings for temperature and supply voltage
- Detects invalid ADC range, undervoltage, overvoltage, and overtemperature
- Commands: `help`, `status`, `sample`, `set temp_limit <value>`, `quit`
- CSV telemetry logging
- Hardware-independent monitoring module
- Unit tests

## Build and run
Requires GCC or Clang. `make` is optional.

```bash
make
./embedded_monitor
make test
make clean
```

Manual build:
```bash
gcc -std=c11 -Wall -Wextra -Wpedantic -Isrc src/main.c src/monitor.c -o embedded_monitor
gcc -std=c11 -Wall -Wextra -Wpedantic -Isrc tests/test_monitor.c src/monitor.c -o test_monitor
./test_monitor
```

On Windows, use GCC through MinGW-w64/MSYS2 or WSL. The program writes `telemetry.csv` in the current directory.

## Project structure
- `src/main.c` — command interface and simulated measurements
- `src/monitor.c`, `src/monitor.h` — monitoring and fault logic
- `tests/test_monitor.c` — unit tests
- `docs/architecture.md` — design and MCU porting notes

## Resume bullet (only after you run and understand it)
**Embedded Sensor Monitoring Firmware | C**
- Built modular Embedded C simulation with ADC-style sensor sampling, threshold-based fault detection, and UART-style command handling.
- Added configurable temperature limits, CSV telemetry logging, and unit tests.
- Separated hardware-independent logic from platform interfaces to support future microcontroller integration.

## Future enhancements
Port ADC/UART drivers to an STM32 board, add interrupt-driven UART buffering, watchdog support, sensor calibration, and hardware-in-the-loop tests.
