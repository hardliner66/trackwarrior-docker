# trackwarrior-docker

## Description
Run a configured version of trackwarrior through docker

## Install
```sh
git clone https://github.com/hardliner66/trackwarrior
cd trackwarrior
sudo ln -s "$PWD/trackwarrior-docker" /usr/local/bin/trackwarrior
```

### Use tasksh as main frontend
```sh
sudo rm /usr/local/bin/trackwarrior
sudo ln -s "$PWD/trackwarrior-docker-tasksh" /usr/local/bin/trackwarrior
```

### Use taskwarrior-tui as main frontend
```sh
sudo rm /usr/local/bin/trackwarrior
sudo ln -s "$PWD/trackwarrior-docker-tui" /usr/local/bin/trackwarrior
```

## Usage
Just run `trackwarrior` to open the configured fronted (default: fish shell)

## Integrate with starship
1) Locally install taskwarrior
2) Install [starship](https://starship.rs/guide/#%F0%9F%9A%80-installation)
3) Set the correct rights for your local taskwarrior to read the data from the container
```sh
# trackwarrior needs to be used at least once
sudo chown "$(id -u):$(id -g)" ~/.trackwarrior-docker/.task/pending.data
```

4) Add the following to your starship.toml

```toml
[custom.current_task]
command = """TASKRC=~/.trackwarrior-docker/.taskrc TASKDATA=~/.trackwarrior-docker/.task unbuffer task starship-project | head -5 | tail -1 | sed "s/No matches./[No active task]/" | xargs"""
when = true
shell = "bash"
```

## Run with docker
Use the script `trackwarrior-docker` or run docker manually:
```sh
docker run --rm -it \
  -v "/etc/timezone:/etc/timezone:ro" \
  -v "/etc/localtime:/etc/localtime:ro" \
  -v "$HOME/.trackwarrior-docker:/root" hardliner66/trackwarrior:latest
```

## Locally build and run docker
Use the script `local-trackwarrior-docker` or run docker manually:
```sh
docker build -t hardliner66/trackwarrior:latest .
  -v "$HOME/.trackwarrior-docker:/root" hardliner66/trackwarrior:latest
```
