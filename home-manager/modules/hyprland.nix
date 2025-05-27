# This Hyprland configuration is translated from your sway.nix.hy
# It includes equivalent settings for gaps, input, keybindings, and startup commands.
# Additional common Hyprland settings are included as a starting point.

{ config, pkgs, lib, ... }:

{

  # Enable Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    # If you need a specific Hyprland package (e.g., from an overlay), uncomment and set it here:
    # package = pkgs.hyprland;

    # Global Hyprland settings
    settings = {
      # See https://wiki.hyprland.org/Configuring/Configuring-Hyprland/ for more options

      monitor = [

	"HDMI-A-1, preferred, auto, 1, bitdepth, 10, cm, hdr"
      ];

      # Gaps (inner and outer)
      general = {
        gaps_in = 8; # Matches sway.gaps.inner
        gaps_out = 5; # Matches sway.gaps.outer
        border_size = 1; # Default border size, adjust as needed
        "col.active_border" = "rgba(45c487ff)";
        layout = "dwindle"; # Default layout, Sway's default is similar to dwindle or master
        no_border_on_floating = 1;
      };

      # Input configuration (touchpad settings)
      input = {
        kb_layout = "us,dk";
        kb_options = "grp:shifts_toggle";


        follow_mouse = 1;
        float_switch_override_focus = 0;
        repeat_delay = 300;
        repeat_rate = 50;

        sensitivity = -0.5; # -1 to 1, 0 means no modification. Adjust as needed.
      };

      decoration = {
        # Hyprland usually hides titlebars by default, but you can explicitly set:
        # col.shadow = rgba(1a1a1aee); # Example shadow color
        blur = {
          enabled = true;
          size = 3;
          passes = 2;
        };
      };

      # Keybindings
      # Mod4 is the Super key (Windows key)

      bindm = [
        # Move floating windows with Super + LMB
        "SUPER, mouse:272, movewindow"

        # Resize floating windows with Super + RMB
        "SUPER, mouse:273, resizewindow"
      ];

      bind = [
        # Close active window (Matches Mod4+q exec swaymsg kill)
        "SUPER, Q, killactive,"

        # Launch terminal (Matches Mod4+Return exec kitty)
        "SUPER, RETURN, exec, kitty"


        # Launch application launcher (Matches Mod4+d
        "SUPER, D, exec, tofi-drun --drun-launch=true"

        # Lock screen (Matches Mod4+p exec swaylock)
        "SUPER, P, exec, swaylock" # Ensure swaylock is installed

        ",XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
        ",XF86AudioRaiseVolume,  exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        ",XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"

        # --- Common Navigation/Window Management Bindings (Add/Modify as needed) ---
        # Move focus
        "SUPER, h, movefocus, l"
        "SUPER, l, movefocus, r"
        "SUPER, k, movefocus, u"
        "SUPER, j, movefocus, d"

        # Move window
        "SUPER_SHIFT, h, movewindow, l"
        "SUPER_SHIFT, l, movewindow, r"
        "SUPER_SHIFT, k, movewindow, u"
        "SUPER_SHIFT, j, movewindow, d"

        # Switch workspaces (Matches sway's workspace switching with Mod4 + number)
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        # Move window to workspace
        "SUPER_SHIFT, 1, movetoworkspacesilent, 1"
        "SUPER_SHIFT, 2, movetoworkspacesilent, 2"
        "SUPER_SHIFT, 3, movetoworkspacesilent, 3"
        "SUPER_SHIFT, 4, movetoworkspacesilent, 4"
        "SUPER_SHIFT, 5, movetoworkspacesilent, 5"
        "SUPER_SHIFT, 6, movetoworkspacesilent, 6"
        "SUPER_SHIFT, 7, movetoworkspacesilent, 7"
        "SUPER_SHIFT, 8, movetoworkspacesilent, 8"
        "SUPER_SHIFT, 9, movetoworkspacesilent, 9"
        "SUPER_SHIFT, 0, movetoworkspacesilent, 10"

        # Fullscreen
        "SUPER, F, fullscreen,"

        # Toggle float
        "SUPER, O, togglefloating,"

        # Example: Reload Hyprland config
        "SUPER_SHIFT, R, exec, hyprctl reload"

	#Screenshot
	"SUPER, T, exec, grimblast save area"
	"SUPER_SHIFT, T, exec, grimblast save output"

      ];

      windowrule = [
        "float,title:^(Steam)$"
        "size 80% 80%,title:^(Steam)$"
        "center,title:^(Steam)$"
        "workspace 3 silent,title:^(Steam)$"

        "float,title:^(Friends List)$"
        "size 25% 80%,title:^(Friends List)$"
        "center,title:^(Friends List)$"
        "workspace 3 silent,title:^(Friends List)$"

        "float,title:^(Special Offers)$"
        "size 25% 80%,title:^(Special Offers)$"
        "center,title:^(Special Offers)$"
        "workspace 3 silent,title:^(Special Offers)$"
      ];

      exec-once = [
        "steam &"
        "waybar &"
      ];
      exec = [
        "swww-daemon &"
        "swww img ~/Pictures/Wallpaper/wall1.jpg &"

      ];

      env = [
        "XCURSOR_THEME,Adwaita" # Change to your preferred cursor theme
        "XCURSOR_SIZE,18" # Adjust size as needed

        "GTK_THEME,Adwaita:dark" # Change to your preferred GTK theme

        # Example: QT environment variables for Wayland compatibility
        "QT_QPA_PLATFORM,wayland"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        # "QT_QPA_PLATFORMTHEME,qt5ct" # Uncomment if using qt5ct for QT themeing
      ];

      # Gestures (for touchpads)
      gestures = {
        workspace_swipe = true;
        workspace_swipe_distance = 300;
      };

      # Animations
      animations = {
        enabled = true;
	bezier = [
          "slowStartEnd, 0.39, 0.575, 0.39, 0.98"
        ];

        # Animation configurations with the specified bezier curve and slide up/down
        animation = [
          "windows, 1, 2, slowStartEnd, slide left" # Slide up when opening
          "windowsOut, 1, 2, slowStartEnd, slide right" # Slide down when closing
          "workspaces, 1, 8, default"
	  "border, 1, 5, default"
          "borderangle, 1, 3, default"
        ];
				 # Define a custom bezier curve for a snappy feel
  # Define an even smoother bezier curve
      };

      # Dwindle layout settings (if using dwindle layout)
      dwindle = {
        pseudotile = true;
        force_split = 2;
      };


      # Master layout settings (if using master layout)
      # master = {
      #   new_is_master = true;
      # };

      # Window rules (example)
      # windowrulev2 = enablefullscreen,class:^(mpv)$
      # windowrulev2 = float,class:^(pavucontrol)$
      # windowrulev2 = stayfocused,class:^(wofi)$
    };
  };

  # Ensure necessary packages are installed
  home.packages = with pkgs; [
    kitty # Your terminal emulator
    wofi # Your application launcher
    swaylock # Your screen locker
    swww # For wallpaper management
    mpv
    waybar
    pavucontrol
    pulseaudioFull
    ripgrep
    nodejs_24
    neofetch
    grimblast
    # Add other packages you use here, e.g., waybar, dunst, polkit-kde-authentication-agent-1
  ];

  # If you were using XDG autostart in Sway, you might need to ensure
  # relevant services are enabled in Home Manager for Hyprland.
  # Example:
  # systemd.user.services.polkit-kde-authentication-agent-1 = {
  #   enable = true;
  #   description = "Polkit Authentication Agent";
  #   wantedBy = [ "graphical-session.target" ];
  #   partOf = [ "graphical-session.target" ];
  #   serviceFile = {
  #     ExecStart = "${pkgs.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1";
  #     Restart = "on-failure";
  #     Type = "simple";
  #   };
  # };
}

