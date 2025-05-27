{ config,pkgs, ... }:

let
  cybersecurityPackages = with pkgs; [
    nmap
    tcpdump
    rustscan
    burpsuite
    feroxbuster
    ghidra
    metasploit
    openvpn
    bettercap
    wireshark
    chromium
    iw
    nikto
    python312Packages.impacket
  ];
in
{ environment.systemPackages = cybersecurityPackages; }
