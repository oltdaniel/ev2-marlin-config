FROM python:3.9.0-buster

RUN pip install -U https://github.com/platformio/platformio-core/archive/develop.zip
RUN platformio update
RUN pio platform install ststm32@~12.1

WORKDIR /marlin