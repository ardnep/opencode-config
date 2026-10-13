# OpenCode config

My OpenCode configuration.

## Shared settings

- `opencode.json`: enables `opencode-mem`.
- `cli.json`: Catppuccin terminal theme.
- `opencode-mem.jsonc`: local memory storage and loopback-only dashboard.

Sign in to OpenCode separately on each device. `service.json`, credentials,
sessions, and memory data are **not** version-controlled or synchronized.
Do not add secrets to these shared files; use environment variables for any
future credentials.
