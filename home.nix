{ config, pkgs, ... }:

{
  imports = [
    ./modules/home-manager/pkgs.nix
  ];

  home.username = "tarrey";
  home.homeDirectory = "/home/tarrey";

  xresources.properties = {
    "Xcursor.size" = 24;
  };

  home.stateVersion = "25.11";
}
