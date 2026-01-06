{ config, pkgs, ... }:

{
  home.file.".ideavimrc".text = ''
    set relativenumber
    set number
    set visualbell
    set noerrorbells
    let mapleader = ','

    nmap <leader>e <action>(ShowErrorDescription)

    map J gT
    map K gt

    "" Insert mode
    imap jk <Esc>

    "" Navigating
    map <C-H> <C-W>h
    map <C-J> <C-W>j
    map <C-K> <C-W>k
    map <C-L> <C-W>l

    "" Comments
    map ö :action Commentary<CR>

    "" Use system clipboard
    set clipboard+=unnamed

    "" Hacks
    xnoremap p pgvy
    nnoremap <C-U> 20<C-Y>
    nnoremap <C-D> 20<C-E>

    "" PLUGINS
    set surround
    set commentary
    set highlightedyank
    set NERDTree

    "" MJump
    nmap f <action>(MJumpAction.Word0)

    "" 'jklh' in file explorer
    let g:NERDTreeMapActivateNode='l'
    let g:NERDTreeMapJumpParent='h'
    nnoremap <A-q> :action NERDTreeToggle<CR>
  '';
}
