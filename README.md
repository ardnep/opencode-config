# OpenCode config

Shared OpenCode settings, used standalone or as the `.config/opencode`
submodule in [macdoots](https://github.com/ardnep/macdoots).

## Install with dotfiles

```sh
git clone --recurse-submodules git@github.com:ardnep/macdoots.git ~/.dotfiles
sh ~/.dotfiles/.config/opencode/install.sh
```

For an existing dotfiles checkout:

```sh
git submodule update --init --recursive
sh .config/opencode/install.sh
```

## Install standalone

```sh
git clone https://github.com/ardnep/opencode-config.git ~/opencode-config
sh ~/opencode-config/install.sh
```

The installer respects `XDG_CONFIG_HOME` (default: `~/.config`) and symlinks
only the three shared configuration files. Existing files are backed up to
a timestamped directory inside the local OpenCode config directory. Running
the installer again leaves correct symlinks unchanged.

## Shared settings

- `opencode.json`: enables `opencode-mem`.
- `cli.json`: Catppuccin terminal theme.
- `opencode-mem.jsonc`: local memory storage and loopback-only dashboard.

Sign in to OpenCode separately on each device. `service.json`, credentials,
sessions, and memory data are **not** version-controlled or synchronized.
Do not add secrets to these shared files; use environment variables for any
future credentials.

## Update

Edits through the symlinks modify this repository. Commit and push them here,
then commit the updated submodule pointer in the dotfiles repository:

```sh
git -C ~/.dotfiles/.config/opencode add cli.json opencode.json opencode-mem.jsonc
git -C ~/.dotfiles/.config/opencode commit -m "Update OpenCode settings"
git -C ~/.dotfiles/.config/opencode push
git -C ~/.dotfiles add .config/opencode
git -C ~/.dotfiles commit -m "Update OpenCode config submodule"
git -C ~/.dotfiles push
```

On another device, pull the dotfiles changes and update the pinned submodule:

```sh
git -C ~/.dotfiles pull
git -C ~/.dotfiles submodule update --init --recursive
```
