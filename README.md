# Minecraft Server

## Introduction
This is a very simple Mincraft Server.

Originaly written for a tutorial but I decided it might be useful for others out there.

## Simple Usage
The easiest way to get the container running is with the command below. This runs the container and opens the default Minecraft Port. You also need to add the environment variable EULA for the container to start.

I added the EULA functinality as you are required to create a file in order for the server to run. As this is just a container running their software I thought it would be best to honor the acknowledgement of the EULA.

Note that the below command does not assign a static volume meaning that if the container is destoyed, the world data will be deleted.

```
docker run -p25565:25565 -e EULA=true dbarszczak/minecraft-server
```

## Advanced Usage
The command below gives you a little more control over the Java Virtual Environment as well as defining a volume to keep the world data saved.

The EULA environment variable is there to honour the requirement of EULA text file required on a standard install.

The XMS variable tells the Java Virtual Machine to start with 1024M of RAM.

The XMX varable tell the Java Virtual Machine the maximum amount of RAM we want it to use.

The -p argument tells Docker to map port 25565 on the host to 25565 in the container.

The -v argument tells Docker to create a Docker Volume called minecraft and map it to /usr/src/minecraft in the container.

```
docker run -p25565:25565 -e EULA=true -e XMS=1024M -e XMX=1024M -v minecraft:/usr/src/minecraft/
```

## Docker Compose Usage

```
version: "3.7"

services:
    minecraft:
      image: dbarszczak/minecraft-server:1.0.0
      restart: always
      networks:
        - minecraft
      environment:
        XMX: 1024M
        XMS: 1024M
        EULA: "true"
      volumes:
        - minecraft:/usr/src/minecraft

networks:
    minecraft:
        attachable: true

volumes:
    minecraft:
```
