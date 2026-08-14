{ pkgs, ... }:
# Awesome, mkDerivation locks network access (not mentioned anywhere)
# which requires a special rust version (buildRustPackage),
# which requires rustPlatform (not mentioned anywhere about where the fuck this is???)
# which turns out to be located inside pkgs.
# another day another fuckass nix issue
# seriously people have a phobia of documentation for nix???
pkgs.rustPlatform.buildRustPackage {
  pname = "nscratch";
  version = "v0.1.0";

  src = pkgs.fetchgit {
    url = "https://github.com/Vizkid04/niri-scratchpad/";
    rev = "cbcb8f7fdf1a5f732dcdf3a842c93585906c5ea0";
    hash = "sha256-ZAdXkbkoRYLdj8d0G/hczj/uCWRiixyaPHieTo0vz1w=";
  };

  cargoHash = "sha256-Wsy6WXWZzRMhS6+dcxirI7I2AbK/bnU9y2cKqAhwe2Q=";

  meta = {
    description = "A powerful scratchpad system for Niri featuring both static and dynamic indexed scratchpads.";
    homepage = "https://github.com/Vizkid04/niri-scratchpad/";
  };
}
