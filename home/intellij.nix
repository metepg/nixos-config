{ pkgs, ... }:

let
  mjump = pkgs.fetchzip {
    url = "https://plugins.jetbrains.com/plugin/download?rel=true&updateId=761814";
    hash = "sha256-yZJ7GPcr3nU+IQ1mLroWU3u9X53HgNNVpxQRVdSdbD4=";
    extension = "zip";
  };
in
{
  home.packages = with pkgs; [
    (jetbrains.plugins.addPlugins jetbrains.idea [
      "ideavim"
      mjump
    ])
  ];
}
