# Dotfiles

Personal dotfiles organized for GNU Stow. Packages map into `~/.config` and related paths.

## Packages

- `fastfetch` - Fastfetch config and `ff` image wrapper for Kitty graphics protocol
- `fish` - Fish shell config, aliases, colors, and startup behavior
- `hypr` - Hyprland config (bindings, monitors, rules, idle/lock, scripts)
- `kitty` - Kitty terminal config and themes
- `starship` - Starship prompt configuration
- `waybar` - Waybar config and scripts for Hyprland/Omarchy setup

## Requirements

- `stow`
- `fish`, `kitty`, `starship`, `fastfetch`, `waybar`, `hyprland`
- Extras referenced by configs: `zoxide`, `mise`, `eza`, `wl-clipboard`, `wireplumber`, `tailscale`
- Fastfetch image wrapper extras: `ffmpeg` or `imagemagick`, Kitty graphics protocol support
- Hyprland helpers: `hypridle`, `hyprlock`, `hyprsunset`
- Hyprland/Omarchy scripts (used by Waybar config)

## Install

Clone and stow individual packages:

```bash
git clone <repo-url> ~/Dotfiles
cd ~/Dotfiles

stow -t ~ fish
stow -t ~ kitty
stow -t ~ starship
stow -t ~ waybar
stow -t ~ fastfetch
stow -t ~ hypr
```

Remove a package:

```bash
stow -D -t ~ fish
```

## Notes

- Fastfetch uses `~/.config/fastfetch/ff` to render an image with Kitty; see `fastfetch/.config/fastfetch/README.md` for full details.
- Waybar config calls Omarchy helpers and Hyprland modules; it expects those commands to exist on your system.
- Hyprland config is split across `~/.config/hypr/*.conf` with scripts in `~/.config/hypr/scripts`.
- Fish config auto-runs `~/.config/fastfetch/ff` on interactive shells unless running inside Neovim.

## Local customization

Prefer to fork or add overrides rather than editing the tracked files if you want to keep upstream clean.
