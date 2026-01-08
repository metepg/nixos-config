{ lib, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    extraConfig = ''
      set history=1000       " Number of commands to remember in history
      set undofile           " Enable undo history to be persistent
      set undodir=~/.vimundo " Directory for storing undo history
      set viminfo='100,<1000,s100,:0 " Save marks, search history, etc.
    '';
  };
}
