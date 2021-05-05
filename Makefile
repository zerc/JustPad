BASE_DIR=

# Arduino CLI executable name and directory location
ARDUINO_CLI = ../arduino-cli.exe

# Arduino CLI Board type
BOARD_TYPE ?= arduino:avr:uno

# Default port to upload to
SERIAL_PORT ?= COM3

# Optional verbose compile/upload trigger
V ?= 0
VERBOSE=

# Build path -- used to store built binary and object files
#BUILD_PATH=$(BASE_DIR)_build
#E:\\repos\\arduino\\pad\\_build
#BUILD_CACHE_PATH=$(BASE_DIR)_cache
#E:\\repos\\arduino\\pad\\_cache 

ifneq ($(V), 0)
    VERBOSE=-v
endif

.PHONY: all compile upload clean

all: compile

compile:
	$(ARDUINO_CLI) compile $(VERBOSE) --build-path=$(BASE_DIR)_build --build-cache-path=$(BASE_DIR)_cache --fqbn $(BOARD_TYPE)

upload:
	$(ARDUINO_CLI) upload $(VERBOSE) -p $(SERIAL_PORT) --fqbn $(BOARD_TYPE) --input-dir=$(BASE_DIR)_build

clean:
	@rm -rf $(BUILD_PATH)
