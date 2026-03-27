## Project: consart (dotfiles)

Personal dotfiles repository. Configs for zsh, vim, tmux, and related tools.

### Rules
- **Never store secrets** (passwords, tokens, API keys, private keys) in any file
- Keep changes simple and concise — no over-engineering
- Preserve existing style and formatting conventions in each config file
- Test shell syntax when editing shell configs (e.g. `zsh -n`, `bash -n`)
- This repo is in git — no backup files needed
- **Shell completions**: add CLI tool completions to `zsh/completion.zsh` using `iscmd <tool> && source <(command <tool> completion zsh)` pattern. Custom compdef functions go in `zsh/functions/Completion/`.
- **zsh functions**: always use `#!/usr/bin/env -S zsh -f` shebang (`-S` lets env split args, `-f` disables startup files for clean execution).
