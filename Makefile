CC = gcc
CFLAGS = -std=c11 -Wall -Wextra -Wpedantic -O2
INCLUDES = -Isrc
.PHONY: all run test clean
all: embedded_monitor
embedded_monitor: src/main.c src/monitor.c src/monitor.h
	$(CC) $(CFLAGS) $(INCLUDES) src/main.c src/monitor.c -o $@
test_monitor: tests/test_monitor.c src/monitor.c src/monitor.h
	$(CC) $(CFLAGS) $(INCLUDES) tests/test_monitor.c src/monitor.c -o $@
run: embedded_monitor
	./embedded_monitor
test: test_monitor
	./test_monitor
clean:
	rm -f embedded_monitor test_monitor telemetry.csv
