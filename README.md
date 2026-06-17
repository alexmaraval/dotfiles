# Dotfiles

Personal dotfiles for setting up a new machine quickly.

## What's Included

- Bash: `~/.bashrc`
- Zsh / Oh My Zsh: `~/.zshrc`
- Git: `~/.gitconfig` and `~/.config/git/ignore`
- Tmux: `~/.tmux.conf`
- Vim: `~/.vimrc`

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
