{
  lib,
  stdenvNoCC,
  fetchurl,
  makeWrapper,
  gawk,
  cabextract,
  coreutils,
  curl,
  wget,
  lsb-release,
  mesa-demos,
  p7zip,
  bc,
  xorg,
  mokutil,
  xdg-utils,
  samba,
  wineWowPackages,
  winetricks,
}:

stdenvNoCC.mkDerivation rec {
  pname = "autodesk-fusion-360-installer";
  version = "2.1.5-alpha"; # matches the version pinned inside the script itself

  src = fetchurl {
    # Codeberg is canonical; GitHub is a mirror kept in sync by the author.
    # This hash was computed from the GitHub mirror on 2026-08-14 — if you
    # pull from Codeberg instead and Nix complains about a hash mismatch,
    # the content has diverged and you'll need to re-fetch/re-hash.
    url = "https://codeberg.org/cryinkfly/Autodesk-Fusion-360-on-Linux/raw/branch/main/files/setup/autodesk_fusion_installer_x86-64.sh";
    hash = "sha256-ECOQI4H/yQj9qZuyEZ84hcuGnlSZ8q4JGa/CyO0omRs=";
  };

  dontUnpack = true;
  nativeBuildInputs = [ makeWrapper ];

  # Every command the script's check_required_packages() probes for.
  runtimeDeps = [
    gawk
    cabextract
    coreutils
    curl
    wget
    lsb-release
    mesa-demos # provides glxinfo
    p7zip # provides `7z` — swap for `_7zz`/`sevenzip` if this is gone on your channel
    bc
    xorg.xrandr
    mokutil
    xdg-utils
    samba # provides `wbinfo`
    wineWowPackages.staging # must be >= 9.8, staging build recommended
    winetricks
  ];

  installPhase = ''
    runHook preInstall

    cp "$src" ./installer.sh
    chmod +w ./installer.sh

    # Upstream bug (present as of 2.0.7-Alpha): check_install_firefox_deb()
    # contains a malformed, duplicate re-definition of is_snap_firefox_installed
    # (missing parens, not valid bash function syntax). The real function is
    # already defined earlier and used correctly a few lines below — this
    # block is dead code and its stray `}` breaks bash's parser once reached.
    # Strip it.
    sed -i '/# Function to check if Firefox is installed via Snap/,/^    }$/d' ./installer.sh

    install -Dm755 ./installer.sh "$out/libexec/${pname}/installer.sh"

    makeWrapper "$out/libexec/${pname}/installer.sh" "$out/bin/fusion360-install" \
      --prefix PATH : ${lib.makeBinPath runtimeDeps}

    runHook postInstall
  '';

  # Passthru so you can `nix run .#fusion360-install -- --uninstall` etc.
  meta = with lib; {
    description = "Wrapped installer for running Autodesk Fusion 360 on Linux via Wine";
    homepage = "https://codeberg.org/cryinkfly/Autodesk-Fusion-360-on-Linux";
    license = licenses.mit; # the installer script itself; Fusion 360 is proprietary
    platforms = [ "x86_64-linux" ];
    mainProgram = "fusion360-install";
  };
}
