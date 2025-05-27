{ config, pkgs, lib, ... }:

{
  services.xserver.videoDrivers = [ "intel" ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ intel-media-driver intel-vaapi-driver ];
  };

  environment.variables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
}

