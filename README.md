# Visual Studio Code Web Docker

## Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Usage](#usage)
- [Contributing](../CONTRIBUTING.md)

## About <a name = "about"></a>

This will start a docker container exposing a port where you can access Visual Studio Code from a browser. 
No SSH or other requirements

## Getting Started <a name = "getting_started"></a>

docker build -t "manut999/vscode-serve-web" .   
docker run --name vscode-web -d -p 8000:8000 -v ./vscode:/home/vscode_user/vscode manut999/vscode-serve-web
docker stop vscode-web


These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See [deployment](#deployment) for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them.

```
Give examples
```

### Installing

A step by step series of examples that tell you how to get a development env running.

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo.

## Usage <a name = "usage"></a>

Add notes about how to use the system.
