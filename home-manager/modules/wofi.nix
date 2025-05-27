{ config, pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    style = ''
      * {
          background-color: #23302e;
          color: #ffffff;
          /* Add other styling options as needed */
      }
    '';
  };
}
