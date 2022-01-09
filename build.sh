#!/usr/bin/env bash

set +x

CONFIG_FILES=("Configuration.h" "Configuration_adv.h")

# Copy configs
for f in "${CONFIG_FILES[@]}"; do
    cat $f | tee Marlin/Marlin/$f
done

# Build docker image
docker build -t marlinfw:latest .
# Build Firmware
docker run -v $(pwd)/Marlin:/marlin marlinfw:latest pio run -e STM32F103RET6_creality_maple