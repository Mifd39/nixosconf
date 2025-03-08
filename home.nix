{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "mifd";
  home.homeDirectory = "/home/mifd";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.swaybg
    pkgs.swaylock
  ];

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
        input =  {
          "type:touchpad" = {
            tap = "enabled";
            natural_scroll = "enabled";
          };
        };
        window = {
          titlebar = false;
        };
        keybindings = lib.mkOptionDefault {
         "Mod4+q" = "exec swaymsg kill";
         "Mod4+Return" = "exec kitty";
         "Mod4+d" = "exec wofi --show drun";
         "Mod4+p" = "exec swaylock";
        };
        startup = [
          {command = "swww-daemon&; disown";}
          {command = "swww img ~/Pictures/shop.gif";}
        ];
      };
    };

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
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {

  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
