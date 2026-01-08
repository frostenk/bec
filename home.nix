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
  
  programs.git = {
     enable = true;
     userName = "Frostenk";
     userEmail = "sonicfan302011@gmail.com";
  };

  home.stateVersion = "25.11";
}
