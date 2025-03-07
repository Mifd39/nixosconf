{ pkgs, ... }:

let
  cybersecurityPackages = with pkgs; [
    nmap
    tcpdump
    rustscan
    metasploit
    burpsuite
    ghidra
    openvpn
    bettercap
    iw
  ];
in
{
  environment.systemPackages = cybersecurityPackages;
}

