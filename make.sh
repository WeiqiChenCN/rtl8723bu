#!/bin/bash

CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm make clean
CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm make -j4 KSRC=`realpath ../linux-raspberrypi` modules
