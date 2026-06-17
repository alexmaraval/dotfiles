# Dotfiles

Personal dotfiles for setting up a new machine quickly.

## What's Included

- Bash: `~/.bashrc`
- Zsh / Oh My Zsh: `~/.zshrc`
- Prompt: `~/.p10k.zsh`
- Git: `~/.gitconfig` and `~/.config/git/ignore`
- GitHub CLI preferences: `~/.config/gh/config.yml`
- Tmux: `~/.tmux.conf`
- Vim: `~/.vimrc`
- Keyboard remaps: `~/.config/karabiner/karabiner.json`
- System monitors: `~/.config/btop/btop.conf`, `~/.config/htop/htoprc`,
  and `~/.config/macmon.json`

## Install

From this repository:

```sh
./install.sh
```

The installer creates symlinks from files in `home/` into your real home
directory. If a target file already exists, it is moved to
`~/.dotfiles-backup/<timestamp>/` first.

## Local Secrets And Machine-Specific Settings

Do not commit tokens, API keys, private paths, or work-machine-only settings.
Use ignored local files instead:

- `~/.bashrc.local`
- `~/.zshrc.local`
- `~/.gitconfig.local`

For example, put private environment variables such as `WANDB_API_KEY` in
`~/.bashrc.local` or in a dedicated secrets manager.

GitHub CLI authentication is intentionally not tracked. Keep
`~/.config/gh/hosts.yml` local to each machine.

## New Machine Checklist

1. Clone this repo.
2. Run `./install.sh`.
3. Install optional shell dependencies:
   - Oh My Zsh
   - `zsh-autosuggestions`
   - `zsh-syntax-highlighting`
   - tmux
   - vim
4. Add any private values to `~/.bashrc.local` or `~/.zshrc.local`.
