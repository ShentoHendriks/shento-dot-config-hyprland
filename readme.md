## Getting started

1. `chmod +x install.sh`
2. `./install.sh`

## Installing

Navigate to `shento-dot-config-hyprland`

```bash
stow [application]
```

If error due existing .config files

```bash
rm ~/.config/[folder]/*
#example rm ~/.config/waybar/*
```

## Making terminal pretty

```bash
code ~/.bashrc

# Add the following code under the comments ~/.bashrc
eval "$(starship init bash)"
eval "neofetch"

# then run this command
source ~/.bashrc
```

## Basic shortcuts

You can open Terminal with `Windows + Q`
Close windows with `Ctrl Q`
Open search (**wofi**) with `Ctrl Space`
Switch active app using `Windows + Shift + Arrow left/right`
Go to a workspace using `Windows 1-10`
Move application to a workspace using `Windows Shift 1-10`
Drag applications to other locations using `Windows + LMB`
Resize applications with `Windows + RMB`
