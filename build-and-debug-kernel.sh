#!/usr/bin/bash

# We override these settings by running this script with arguments
I3_WORKSPACE_NUM=10
I3_WORKSPACE_NUM=${2:-$I3_WORKSPACE_NUM}
ASSIGNMENT=ASST0
ASSIGNMENT=${1:-$ASSIGNMENT}

BUILD_CMD="cd ~/ece344/os161/kern/conf && ./config $ASSIGNMENT && cd ~/ece344/os161/kern/compile/$ASSIGNMENT && make depend && make && make install"
RUN_CMD="cd ~/ece344/root && sys161 -w kernel"
GDB_CMD="\"target\ remote\ unix:.sockets/gdb\""
DEBUG_CMD="echo $GDB_CMD >> ~/.gdbinit && cd ~/ece344/root && cs161-gdb kernel"

i3-msg workspace $I3_WORKSPACE_NUM
gnome-terminal -- bash -c "docker run --name ece344 --volume "$(pwd):/root/ece344" -it --rm tech4me/ece344:latest bash -c \"$BUILD_CMD && $RUN_CMD\""
sleep 1 # Wait for docker and gdb to load up
gnome-terminal -- bash -c "docker exec -it ece344 bash -c \"$DEBUG_CMD\""
