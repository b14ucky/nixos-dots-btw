{ pkgs, ... }:

let
  tokyonight-vim = pkgs.vimUtils.buildVimPlugin {
    name = "tokyonight-vim";
    src = pkgs.fetchFromGitHub {
      owner = "ghifarit53";
      repo = "tokyonight-vim";
      rev = "master";
      sha256 = "sha256-ui/6xv8PH6KuQ4hG1FNMf6EUdF2wfWPNgG/GMXYvn/8=";
    };
  };
in
{
  programs.vim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      lightline-vim
      tokyonight-vim
      vim-commentary
    ];

    extraConfig = ''
      set number
      set relativenumber
      set expandtab
      set tabstop=2
      set shiftwidth=2
      set softtabstop=2
      set smartindent
      set ignorecase
      set smartcase
      set clipboard=unnamedplus
      set termguicolors
      set noshowmode
      set signcolumn=yes
      set scrolloff=8

      let g:tokyonight_style = 'night'
      let g:tokyonight_enable_italic = 1
      colorscheme tokyonight

      let g:lightline = {
        \ 'colorscheme': 'tokyonight',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
        \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ] ]
        \ },
        \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
        \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
        \ }

      autocmd BufRead,BufNewFile *.kdl set filetype=kdl
      autocmd FileType kdl setlocal tabstop=4 shiftwidth=4 expandtab
      
      nmap <C-_> gcc
      vmap <C-_> gc
    '';
  };
}
