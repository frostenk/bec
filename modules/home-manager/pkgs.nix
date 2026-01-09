{ config, pkgs, ... }:

{

  home.packages = with pkgs; [

    # general.
    fastfetch
    htop
    wezterm
    wget

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
    cowsay
    tree
    gnumake
    glow

    # extensions
    nemo-fileroller
 
    # audio
    alsa-utils

  ];

}
