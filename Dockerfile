FROM debian:latest
LABEL maintainer="Manuel Trunk"

EXPOSE 8000/tcp

RUN apt-get update && \
    apt-get upgrade && \
    apt-get -y install wget gpg && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg && \
    install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg && \
    sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' && \
    rm -f packages.microsoft.gpg && \
    apt -y install apt-transport-https && \
    apt update && \
    apt -y install git code && \
    groupadd --gid 1000 vscode_group && \
    useradd --uid 1000 --gid 1000 -ms /bin/bash vscode_user && \
    chown -R 1000:1000 /home/vscode_user

USER vscode_user
WORKDIR /home/vscode_user

RUN mkdir /home/vscode_user/projects

#RUN addgroup --gid 1000 app && \
#    adduser --uid 1000 --gid 1000 --disabled-password --gecos App app
#USER app
#WORKDIR /home/app

CMD code serve-web --host 0.0.0.0 --without-connection-token --accept-server-license-terms

