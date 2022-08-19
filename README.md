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

## Integrate with starship
1) Locally install taskwarrior
2) Set the correct rights for your local taskwarrior to read the data from the container
```sh
# trackwarrior needs to be used at least once
sudo chown "$(id -u):$(id -g)" ~/.trackwarrior-docker/.task/pending.data
```

3) Add the following to your starship.toml

```toml
[custom.current_task]
command = """TASKRC=~/.trackwarrior-docker/.taskrc TASKDATA=~/.trackwarrior-docker/.task unbuffer task starship-project | head -5 | tail -1 | sed "s/No matches./[No active task]/" | xargs"""
shell = "bash"
```

## Run with docker
Use the script `trackwarrior-docker` or run docker manually:
```sh
docker run -it -v "$HOME/.trackwarrior-docker:/root" hardliner66/trackwarrior:latest
```

## Locally build and run docker
Use the script `local-trackwarrior-docker` or run docker manually:
```sh
docker build -t trackwarrior .
docker run -it -v "$HOME/.trackwarrior-docker:/root" trackwarrior:latest
```
