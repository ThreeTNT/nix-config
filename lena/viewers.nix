{
  lib,
  pkgs,
  ...
}:
let
  # zathura is the with-plugins wrapper: pdf (mupdf), ps, djvu and cb ship as
  # separate desktop files, so point each mime at the one that declares it
  zathura-pdf = "org.pwmt.zathura-pdf-mupdf.desktop";
  zathura-ps = "org.pwmt.zathura-ps.desktop";
  zathura-djvu = "org.pwmt.zathura-djvu.desktop";
  zathura-cb = "org.pwmt.zathura-cb.desktop";
  swayimg-desktop = "swayimg.desktop";

  # formats swayimg declares in its desktop file
  image-mimes = [
    "image/avif"
    "image/bmp"
    "image/gif"
    "image/heif"
    "image/jpeg"
    "image/jpg"
    "image/jxl"
    "image/pbm"
    "image/pjpeg"
    "image/png"
    "image/svg+xml"
    "image/tiff"
    "image/webp"
    "image/x-bmp"
    "image/x-exr"
    "image/x-png"
    "image/x-portable-anymap"
    "image/x-portable-bitmap"
    "image/x-portable-graymap"
    "image/x-portable-pixmap"
    "image/x-targa"
    "image/x-tga"
  ];
in
{
  home-manager.users.lena = {
    programs.zathura.enable = true; # pdf / ps / djvu / comics

    catppuccin.zathura.enable = true;

    home.packages = with pkgs; [
      swayimg # images
      xdg-utils # xdg-open
    ];

    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        # Documents -> zathura
        "application/pdf" = zathura-pdf;
        "application/oxps" = zathura-pdf;
        "application/epub+zip" = zathura-pdf;
        "application/x-fictionbook" = zathura-pdf;
        "application/x-mobipocket-ebook" = zathura-pdf;
        "application/postscript" = zathura-ps;
        "application/eps" = zathura-ps;
        "application/x-eps" = zathura-ps;
        "image/vnd.djvu" = zathura-djvu;
        "image/vnd.djvu+multipage" = zathura-djvu;

        # Comics -> zathura, but not plain zip/rar/tar archives
        "application/x-cbr" = zathura-cb;
        "application/x-cbz" = zathura-cb;
        "application/x-cbt" = zathura-cb;
        "application/x-cb7" = zathura-cb;
      }
      // lib.genAttrs image-mimes (_: swayimg-desktop);
    };
  };
}
