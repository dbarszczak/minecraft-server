FROM openjdk:8

ENV XMX=1024M
ENV XMS=1024M

ADD http://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar /usr/src/minecraft/
COPY entrypoint.sh /usr/src/minecraft/entrypoint.sh
COPY eula.txt /usr/src/minecraft/eula.txt

WORKDIR /usr/src/minecraft/

EXPOSE 25565/tcp

ENTRYPOINT [ "./entrypoint.sh" ]
