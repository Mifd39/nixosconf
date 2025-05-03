{ config, pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "kitty";
      defaultWorkspace = "workspace number 1";
      gaps = {
        inner = 8;
        outer = 5;
      };
      input = {
        "type:touchpad" = {
          tap = "enabled";
          natural_scroll = "enabled";
        };
      };
      window = { titlebar = false; };
      keybindings = lib.mkOptionDefault {
        "Mod4+q" = "exec swaymsg kill";
        "Mod4+Return" = "exec kitty";
        "Mod4+d" = "exec wofi --show drun";
        "Mod4+p" = "exec swaylock";
      };
      startup = [
        { command = "swww-daemon&; disown"; }
        { command = "swww img ~/Pictures/wall1.jpg"; }
      ];
    };
  };
}
