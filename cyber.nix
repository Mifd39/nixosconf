{ pkgs, ... }:

let
  cybersecurityPackages = with pkgs; [
    nmap
    tcpdump
    rustscan
    metasploit
    burpsuite
    feroxbuster
    ghidra
    openvpn
    bettercap
    wireshark
    chromium
    iw
    nikto
    python312Packages.impacket
  ];
in { environment.systemPackages = cybersecurityPackages; }
