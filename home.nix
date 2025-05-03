{ config, pkgs, lib, ... }:

let
  swayConfig = import ./modules/sway.nix { inherit config pkgs lib; };
  wofiConfig = import ./modules/wofi.nix { inherit config pkgs lib; };
  kittyConfig = import ./modules/kitty.nix { inherit config pkgs lib; };

in {
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
  home.packages = [ pkgs.swaybg pkgs.swaylock pkgs.zoxide ];

  # Import modules
  imports = [ swayConfig wofiConfig kittyConfig ];

  programs.fish.enable = true;

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {

  };

  home.sessionVariables = { EDITOR = "nvim"; };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
