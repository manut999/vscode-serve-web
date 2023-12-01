# VSCode Web Base Image

## About

This will start a docker container exposing a port where you can access Visual Studio Code (standard from Microsoft, latest version) from a browser. You can use any extension out of the VSCode Marketplace, no adaptions needed. 
This base image contains only git and VSCode. Feel free to derive from this image and create e.g. a Node.js or a Python development environment. 

## Build the image

If you want to build the docker image from scratch, use 
```
docker build -t "manut999/vscode-web-base" .
```

VSCode needs to write files to your host system. If your host user account uses another userId than 1000 and another groupId than 1000, you need to pass those values during the build process. To print user and group information for your user, just use the id command. Example:
```
id
uid=1000(my_username) gid=1000(my_groupname) groups=1000(my_username),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),110(lxd),1001(docker)
```

Different user or group ids can be supplied with the following command during the build process:
```
docker build --build-arg UID=1001 --build-arg GID=1001 -t "manut999/vscode-web-base" .   
```

## Start the container

VSCode needs a directory on where to write settings and store installed extensions. Map this to a local volume using the -v flag, e.g. -v ~/vscode-web-settings:/home/vscode_user. 

You should also map a directory where your projects are stored. Example: -v ~/vscode-projects:/home/vscode_user/projects. 

Important: Make sure those lokal directories (~/vscode-web-settings, ~/vscode-projects) exist and are writable for user / groupd id!

CLI:
```
docker run --name vscode-web-base -d -p 8000:8000 -v ~/vscode-web-settings:/home/vscode_user -v ~/vscode-web-projects:/home/vscode_user/projects manut999/vscode-web-base
```

Docker Compose: 
```
version: "3"
services:
  portainer:
    container_name: vscode-web-base
    image: manut999/vscode-web-base:latest
    ports:
        - 8000:8000
    volumes:
      - ~/vscode-web-settings:/home/vscode_user
      - ~/vscode-web-projects:/home/vscode_user/projects 
    restart: unless-stopped
```

## Setup git

Login to VSCode and then use 
```
git config --global user.name "John Doe"
git config --global user.email "johndoe@email.com"
```
to set your username and email. 