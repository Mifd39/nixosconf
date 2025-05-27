{ config, pkgs, ... }:


{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "bluetooth" "hyprland/language" "tray" ];
        margin-top = 5;
      };
    };

    style = ''
      #waybar {
        background-color: rgba(0,0,0,0);
      }

      #workspaces button {
        padding: 0 4px;
        margin: 0 3px;
        background: #536032;
      }

      #tray {
        padding: 0 4px;
        margin: 0 3px;
      }

      #workspaces button.active {
        background: #45c487;
        color: rgba(0,0,0,1);
      }

      #language {
        background: #58b186;
        padding: 3 12px;
        margin: 0 3px;
        border-radius: 8px;
        color: rgba(0,0,0,1);
      }

      #pulseaudio {
        background: #bfb284;
        padding: 3 12px;
        margin: 0 3px;
        border-radius: 8px;
        color: rgba(0,0,0,1);
      }

      #clock {
        background: #605632;
        padding: 3 12px;
        margin: 0 3px;
        border-radius: 8px;
      }

      #bluetooth {
        background: #bfb284; /* Use the same background color as pulseaudio */
        padding: 3 12px;
        margin: 0 3px;
        border-radius: 8px;
        color: rgba(0,0,0,1); /* Use the same text color as pulseaudio */
      }

    '';

    settings."mainBar"."pulseaudio" = {
      # Display volume percentage and an icon
      format = "{volume}%";
      # Display a different format when muted
      format-muted = "Muted";

      # Define icons based on volume level.
      # You'll likely need a suitable icon font (like Font Awesome) for these.
      format-icons = {
        "0" = ""; # Muted icon (Font Awesome)
        "25" = ""; # Low volume icon (Font Awesome, approximate)
        "50" = ""; # Medium volume icon (Font Awesome, approximate)
        "75" = ""; # High volume icon (Font Awesome, approximate)
        "100" = ""; # Max volume icon (Font Awesome)
      };

      # Toggle mute on click
      on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";

      # Optional: Increase/decrease volume on scroll
      # on-scroll-up = "pactl set-sink-volume @DEFAULT_SINK@ +5%";
      # on-scroll-down = "pactl set-sink-volume @DEFAULT_SINK@ -5%";
      # scroll-step = 5; # Volume change step on scroll
    };

    settings."mainBar"."clock" = {
      # Set the desired date and time format
      format = "{:%Y-%m-%d %H:%M}";
      # Optional: Add tooltip to show full date and time
      tooltip = true;
      tooltip-format = "{:%A}";
    };

settings."mainBar"."bluetooth" = {
      format = "{icon}";
      format-icons = {
	"disabled" = ""; # Bluetooth off icon
	"disconnected" = "󰂲"; # Bluetooth off icon (can be the same)
	"connected" = "󰂯";  # Bluetooth on icon
	"default" = "󰂲";  # Bluetooth on icon
      };
      tooltip = true;
      tooltip-format = "Bluetooth: {status}";
      on-click = "blueman-manager"; # Keep the click action to open Blueman
    };

  };

}
