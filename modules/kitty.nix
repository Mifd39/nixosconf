{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      background_opacity = "0.80";
      background_blur = 5;
    };
    themeFile = "Catppuccin-Mocha";
  };
}
