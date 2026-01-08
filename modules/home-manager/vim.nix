{ lib, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-code-dark
      vim-highlightedyank
      vim-easymotion
    ];
    extraConfig = ''
      set history=1000       " Number of commands to remember in history
      set undofile           " Enable undo history to be persistent
      set undodir=~/.vimundo " Directory for storing undo history
      set viminfo='100,<1000,s100,:0 " Save marks, search history, etc.
      set clipboard=unnamedplus
      set number          " Show current line number
      set relativenumber  " Show relative numbers for easier jumping
      syntax enable       " Enable syntax highlighting

      " --- Theme Configuration ---
      syntax enable
      set termguicolors     " Enables 24-bit RGB color
      colorscheme codedark  " VS Code Dark+
      highlight Normal guibg=#000000 ctermbg=black
      highlight NonText guibg=#000000 ctermbg=black

      " --- Indentation ---
      set expandtab       " Use spaces instead of tabs
      set shiftwidth=2    " Number of spaces for auto-indent
      set softtabstop=2   " Number of spaces for <Tab> key
      set tabstop=2       " Number of spaces a tab counts for
      set smartindent     " Do smart auto-indenting when starting a new line
      set autoindent      " Copy indent from current line when starting a new line
      
      " Map jk and kj to Escape in Insert Mode
      inoremap jk <Esc>
      inoremap kj <Esc>

      " --- Plugin configs ---

      " --- EasyMotion ---
      let g:EasyMotion_do_mapping = 0
      let g:EasyMotion_smartcase = 1
      map f <Plug>(easymotion-overwin-w)

      " --- Highlight Yank ---
      let g:highlightedyank_highlight_duration = 300

    '';
  };
}
