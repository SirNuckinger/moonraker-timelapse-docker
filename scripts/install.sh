#!/usr/bin/env bash
#### Moonraker Timelapse component installer

# shellcheck enable=require-variable-braces

## Error handling
set -Ee

## Debug Option
# set -x

### Check non-root
if [[ ${UID} = "0" ]]; then
    printf "\n\tYOU DONT NEED TO RUN INSTALLER AS ROOT!\n"
    printf "\tYou will be prompted for sudo password if needed!\nExiting...\n"
    exit 1
fi
### END

## Find SRCDIR from the pathname of this script
SRC_DIR="$( cd "$(dirname "$(dirname "${BASH_SOURCE[0]}")")"/ && pwd )"
### END

## Initialize global vars and arrays
DATA_DIR=()
DEPENDS_ON=( moonraker klipper )
MOONRAKER_TARGET_DIR="/opt/moonraker/moonraker/components"
KLIPPER_TARGET_DIR="/opt/printer_data/config"
PKGLIST="wget"
SERVICES=()
### END

cp ${SRC_DIR}/component/timelapse.py ${MOONRAKER_TARGET_DIR}/timelapse.py

cp ${SRC_DIR}/klipper_macro/timelapse.cfg ${KLIPPER_TARGET_DIR}/timelapse.cfg

exit 0
###### EOF ######
