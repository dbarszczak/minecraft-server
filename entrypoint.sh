#!/bin/bash

# Prepare the command.
CMD="java -Xmx${XMX} -Xms${XMS} -jar /usr/src/minecraft/server.jar nogui"

# Output the command to the logs.
echo "Attempting to run: ${CMD}"

# Run the command.
${CMD}