{ config, pkgs, ... }:

{
   home.packages = with pkgs; [

    fastfetch
    htop
    wezterm
    rofi
    nemo
    nemo-fileroller
    neovim
    file-roller
    gimp
    discord
    ungoogled-chromium
    alsa-utils

   ];
}
