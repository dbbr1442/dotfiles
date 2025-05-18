{ config, pkgs, inputs, ... }:
{
    programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;

        extraPackages = with pkgs; [ lua-language-server rust-analyzer clang-tools nixd vscode-langservers-extracted gcc ];
    };
}
