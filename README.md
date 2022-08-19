# trackwarrior-docker

## Description

Run a configured version of trackwarrior through docker and tasksh.

## Install

```sh
git clone https://github.com/hardliner66/trackwarrior
cd trackwarrior
sudo ln -s "$PWD/trackwarrior-docker" /usr/local/bin/trackwarrior
```

## Usage

Just run `trackwarrior` to open an interactive `tasksh` instance.

## Run with docker

```sh
docker run -it -v "$HOME/.trackwarrior-docker:/root" hardliner66/trackwarrior:latest
```

## Locally build and run docker
```sh
docker build -t trackwarrior .
docker run -it -v "$HOME/.trackwarrior-docker:/root" trackwarrior:latest
```
