{ config, pkgs, ... }:

{

  home.packages = with pkgs; [

    # general.
    fastfetch
    htop
    wezterm
    rofi

    # filetypes
    zip
    unzip
    unrar-free
  
    # theming
    lxappearance
    nordic
    reversal-icon-theme
    papirus-icon-theme

    # actual apps
    nemo
    neovim
    file-roller

    # bloat.
    gnome-screenshot
    networkmanagerapplet

    # extensions
    nemo-fileroller
 
    # audio
    alsa-utils

  ];

}
