{ pkgs, ... }:

let
  # IdeaVim
  ideavim = pkgs.fetchzip {
    url = "https://plugins.jetbrains.com/plugin/download?rel=true&updateId=1081387";
    hash = "sha256-syYaUHgit9QVUvEmxOeEMEJN8QK+TXDUUcmsQzpUW60=";
    extension = "zip";
  };

  # MJump
  mjump = pkgs.fetchzip {
    url = "https://plugins.jetbrains.com/plugin/download?rel=true&updateId=761814";
    hash = "sha256-yZJ7GPcr3nU+IQ1mLroWU3u9X53HgNNVpxQRVdSdbD4=";
    extension = "zip";
  };

  # Theme
  vscode-theme = pkgs.fetchzip {
    url = "https://plugins.jetbrains.com/plugin/download?rel=true&updateId=1055891";
    hash = "sha256-W25X7bbHS6lTkuVZneY8f4V4mnnKIw8cgGEZWL10m8s=";
    extension = "zip";
  };
in
{
  home.packages = [
    (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.idea [
      ideavim
      mjump
      vscode-theme
    ])
  ];
}
