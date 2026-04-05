{
  pkgs,
  flavor,
  lib,
  ...
}:
let
  hashes = {
    "Latte-color-schemes" = "sha256-wFZHCwACOFo9BHLTHnapuTLrbFEWa/+0kTXIobJ8cdQ=";
    "Frappe-color-schemes" = "sha256-AnLfRziRFTpAXejbZR7R5E0St5mrpJaGfidE24DiIwo=";
    "Macchiato-color-schemes" = "sha256-Cv15cCTcv5yKGcXOkoB8eQn5c25ipK0xl0eNiSZax/I=";
    "Mocha-color-schemes" = "sha256-kmWdW8Mhsq8pNlsAyjDnWzP9WvR5y1KU2EVBBzGmsOU=";
  };
  theme-name = "${lib.strings.toSentenceCase flavor}-color-schemes";
  out = {
    name = "Catppuccin KDE Theme";
    pname = theme-name;
    version = "0.2.6";

    src = pkgs.fetchzip {
      url = "https://github.com/catppuccin/kde/releases/download/v${out.version}/${theme-name}.tar.gz";
      sha256 = hashes.${theme-name};
      stripRoot = false;
    };

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/color-schemes/
      cp -r ${theme-name}/* $out/share/color-schemes/
      runHook postInstall
    '';

    meta = {
      description = "Soothing pastel theme for KDE, ported to Nix";
      homepage = "https://github.com/VanillaDaFur/catppuccin-gtk";
    };
  };
in
pkgs.stdenv.mkDerivation out
