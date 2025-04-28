{ config, pkgs, inputs, ... }:
{
    ##i refuse to use nixvim because im too dumb lol
    programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;

        plugins = [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ];
        extraPackages = with pkgs; [ lua-language-server rust-analyzer clang-tools nixd vscode-langservers-extracted ];
    };
}
