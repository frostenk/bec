{ lib, config, pkgs, ... }:

{
  imports =
    [
      ./apps/general.nix
      ./apps/bloat.nix
      ./apps/theming.nix
      ./apps/filetypes.nix
    ];

  home.username = "frostenk";
  home.homeDirectory = "/home/frostenk";
  home.stateVersion = "25.11";

  xresources.properties = {
    "Xcursor.size" = 24;
  };

  programs.home-manager.enable = true;
  
  programs.git = {
     enable = true;
     userName = "Frostenk";
     userEmail = "sonicfan302011@gmail.com";
  };

} 
