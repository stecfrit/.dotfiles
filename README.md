# My dotfiles

Currently learning linux, I use these on my macbook pro arch linux setup. There are settings for:

- hyprland
- hyprpaper
- waybar
- kitty
- zsh
- nvim
- starship
- and others as I go

## Requirements

Make sure you install the following first.

### Git

```
sudo pacman -S git
```

### GNU stow

```
sudo pacman -S stow
```

## Install

Clone this repo:

```
$ git clone https://github.com/stecfrit/.dotfiles.git
$ cd .dotfiles
```

Use GNU stow to create symlinks:

```
$ stow */
```
