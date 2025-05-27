{ pkgs, ... }:

let
  gamingPackages = with pkgs; [
    discord
    path-of-building
  ];
in
{
  environment.systemPackages = gamingPackages;

  programs.steam = {
    enable = true;
    # remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    # localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

}

