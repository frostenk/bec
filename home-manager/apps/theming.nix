{ config, pkgs, ... }:

{
  home.packages = with pkgs; [

    lxappearance
    picom
    nordic
    reversal-icon-theme
    papirus-icon-theme

  ];
}
