FROM debian:latest
LABEL maintainer="Manuel Trunk"

RUN apt-get update && \
    apt-get upgrade && \
    apt-get -y install wget gpg && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg && \
    install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg && \
    sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' && \
    rm -f packages.microsoft.gpg && \
    apt -y install apt-transport-https && \
    apt update && \
    apt -y install code && \
    useradd -ms /bin/bash vscode_user

USER vscode_user

WORKDIR /home/vscode_user/vscode

CMD code serve-web --host 0.0.0.0 --without-connection-token --accept-server-license-terms

EXPOSE 8000/tcp