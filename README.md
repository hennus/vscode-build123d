# docker-build123d

Build123d Dev environment (VSCode + OCP-Viewer) in Browser
![ScreenShot](./screenshot.png)

# Quick Start

## Using Docker

`docker run -d  -v ./sample:/data -p 5000:8080 --name build123d ghcr.io/ankurvdev/vscode-build123d:latest `

## Using Podman (Rootless container)

`podman run -d  -v ./sample:/data:Z -p 5000:8080 --name build123d ghcr.io/ankurvdev/vscode-build123d:latest `

The website can be accessed via http://localhost:5000

## Docker compose

```
version: "3"
services:
  build123d:
    image: ghcr.io/ankurvdev/vscode-build123d:main
    restart: unless-stopped
    ports:
      - 5000:8080
    volumes:
      - ./sample:/data
```
