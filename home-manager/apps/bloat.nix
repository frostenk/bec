{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    
    ncmpcpp
    cmatrix
    cava
    tty-clock
    cowsay
    tree
    gnumake
    glow
    networkmanagerapplet
    gnome-screenshot
    gcc
    libnotify

  ];
}
