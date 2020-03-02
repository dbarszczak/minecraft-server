#!/bin/bash

# Prepare the command.
CMD="java -Xmx${XMX} -Xms${XMS} -jar /usr/src/minecraft/server.jar nogui"

# Output the command to the logs.
echo "Attempting to run: ${CMD}"

if [[ $EULA != "true" ]]
  then
    echo "Please accept the EULA by adding -e EULA=true"
    exit
fi

# Run the command.
${CMD}
