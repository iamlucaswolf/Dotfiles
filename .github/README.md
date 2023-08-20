# Dotfiles

**Terminal**: wezterm
**Editor**: Neovim
**Font**: JetBrains Mono

## Usage

```bash
git clone --bare https://github.com/iamlucaswolf/dotfiles $HOME/.dotfiles

alias dotfiles='$(which git) --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
```
