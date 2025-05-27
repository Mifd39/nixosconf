{ config, pkgs, ... }:

{
  programs.tofi = {
    enable = true;

    settings = {
      width = "25%";
      height = "30%";
      border-width = 1;
      border-color = "#4dc981";

      font-size = 19;

      selection-color = "#ffffff";
      selection-background = "#4dc981";
      selection-background-padding = 8;
      selection-background-corner-radius = 20;
      corner-radius = 25;
      input-background-padding = 4;
      outline-width = 0;
      padding-left = "1%";
      padding-top = "1%";
      background-color = "#000000Ef";
      prompt-text = " : ";
      placeholder-text = "...";
      result-spacing = 10;
    };
  };
}

