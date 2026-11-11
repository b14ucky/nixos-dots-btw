{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rustc
    cargo
    rust-analyzer
    clippy
    rustfmt
  ];

  home.sessionVariables = {
    RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  };
}
