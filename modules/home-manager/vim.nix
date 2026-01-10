{ pkgs, ... }:

{
  programs.vim = {
    enable = true;
    
    settings = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      copyindent = true;
      undofile = true;
      undodir = [ "~/.vimundo" ];
      history = 1000;
      mouse = "a";
    };

    plugins = with pkgs.vimPlugins; [
      vim-code-dark
      vim-highlightedyank
      vim-easymotion
    ];

    extraConfig = ''
      set smartindent
      set autoindent
      set softtabstop=2
      set viminfo='100,<1000,s100,:0
      set clipboard=unnamedplus

      " --- Theme ---
      set termguicolors
      colorscheme codedark
      highlight Normal guibg=#000000 ctermbg=black
      highlight NonText guibg=#000000 ctermbg=black

      " --- Key Mappings ---
      inoremap jk <Esc>
      inoremap kj <Esc>

      " --- Plugin Configs ---
      let g:EasyMotion_do_mapping = 0
      let g:EasyMotion_smartcase = 1
      map f <Plug>(easymotion-overwin-w)
      let g:EasyMotion_keys = 'qwertypoiuyxcvbnm,zghfjdklsa'
      let g:highlightedyank_highlight_duration = 300
    '';
  };
}
