{
  pkgs,
  flavor,
  accent,
  ...
}:
let
  hashs = {
    "catppuccin-latte-rosewater-standard" = "sha256-g+TzuM+/Sbx0d1L7xQdWjmNJFX8fbx0crsxX1ukkCow=";
    "catppuccin-latte-flamingo-standard" = "sha256-HJk+mXuM/A2CV9qPxwAxO6t9SfUc7PkpQglxZcFqlxg=";
    "catppuccin-latte-pink-standard" = "sha256-3FqNJBIV7Q1r4Z0NJtHfJ+nJnnn4rDDb2nnczkD1qOY=";
    "catppuccin-latte-mauve-standard" = "sha256-KKdl11qOJektb6sbudx1hk3n+czgE1PnyToFrOmV3Co=";
    "catppuccin-latte-red-standard" = "sha256-adCbJPwKk3wktb0ubGhhly8q4IyEMYXjnU4UkxMg6RE=";
    "catppuccin-latte-maroon-standard" = "sha256-KxMeapo7Kgt2+b6t3otEvilC8L9TSSqoKaMsP1wVBSI=";
    "catppuccin-latte-peach-standard" = "sha256-ElON/L/7M61O7ZSDDMaoAAmcHZgvu4UN8M7DxrP1C1c=";
    "catppuccin-latte-yellow-standard" = "sha256-/ava6XMOPmt83mDzYyxYlzPCrgyqTk1ehRnSOqSxVjk=";
    "catppuccin-latte-green-standard" = "sha256-SEg6lIzA+PoNKDEZoJ25eAZqiMuVKGz0uYn3k4QYGxg=";
    "catppuccin-latte-teal-standard" = "sha256-jpKVU2xdSXINyyvAZ8AIB/r1gGMD7mzR/v+7hg5XG5I=";
    "catppuccin-latte-sky-standard" = "sha256-vRSdii/fqq7wxZH/4vvfx7HGD+RUxgLcCkcNWG39dEM=";
    "catppuccin-latte-sapphire-standard" = "sha256-KPkUqN/8YFfGrVaaCQ4+xm2xak+QQGFQvz9SDC+T2D0=";
    "catppuccin-latte-blue-standard" = "sha256-bRRLOCL4g0uiH2rvEYayKiADYsVOLuZNfghYDj+r8ts=";
    "catppuccin-latte-lavender-standard" = "sha256-GsALWBo3PHFlz0CLKRIBlAGM3P0TQHr061c4Nov63Lg=";
    "catppuccin-frappe-rosewater-standard" = "sha256-Vmp1hhlYmci2/PvAFzmtHn24r7OUi//Uc2c6H3iwmhQ=";
    "catppuccin-frappe-flamingo-standard" = "sha256-h7JvHXSpEh77hogYHvpzZuP4lM9yBldqaYWGolvoA+M=";
    "catppuccin-frappe-pink-standard" = "sha256-TvCLRFYCvt/g5n21ZJ2kxjed8jVpJf5nMJeC9x0zREM=";
    "catppuccin-frappe-mauve-standard" = "sha256-YqEKgreU9obOorq5LR4jCzwfa1TU2v/LRx7nMqiHDFc=";
    "catppuccin-frappe-red-standard" = "sha256-HdU9uO4iep/SWXthuH1c2BRobX85vU6upR9imNv3TdE=";
    "catppuccin-frappe-maroon-standard" = "sha256-4MiT3ILqY0798vkhnQKSpS9XyGyRaxdUXId3BfVJCf8=";
    "catppuccin-frappe-peach-standard" = "sha256-8BckrH8aINUHstAcmvQvcs+7Vr7UvM2omyKWa98FpVE=";
    "catppuccin-frappe-yellow-standard" = "sha256-tmcmy3v8Tp/camU7maUk1fWy3GIVhXYmIg+YoOPKz8k=";
    "catppuccin-frappe-green-standard" = "sha256-xikNgszGjnYkRz2OUkkrDBQNwEfi3E6NMLUYJ5oOJeE=";
    "catppuccin-frappe-teal-standard" = "sha256-I///66Nn/+XsjF8TgmCLR/0r9GYUviT2xFE+0fWZdkI=";
    "catppuccin-frappe-sky-standard" = "sha256-WQLeG6h0LADi1tvN41Ay3XLiTmbof8N/mLD/MNJ4aQ0=";
    "catppuccin-frappe-sapphire-standard" = "sha256-oSHJGgUbySINVFtx1ZzjkOAIvy+0KF404Se5fNFVlZQ=";
    "catppuccin-frappe-blue-standard" = "sha256-SF57DmeVvfb3/iJPL8fmS4g/JZ7fVN6ODplrNQcgh8c=";
    "catppuccin-frappe-lavender-standard" = "sha256-tjOr1Svfp9jfPBC9+dd2PFG/C4FKUvpPU2aNNzH2a90=";
    "catppuccin-macchiato-rosewater-standard" = "sha256-+ErhT0/Qrh0tNmc0rNNSviOyDZNzBo+9aiF9mW+3vtE=";
    "catppuccin-macchiato-flamingo-standard" = "sha256-XwbLu3NMRYRbq3ql3S2Om0XoRXHMuNq1DeFNFBuC3Ds=";
    "catppuccin-macchiato-pink-standard" = "sha256-sGqwQ0qe3dnLgd63ImQwuae7xoPALrb0AABJ5k5d5Cc=";
    "catppuccin-macchiato-mauve-standard" = "sha256-T0fyG8hteWpkKmiyDRmozX8nVvG6ukUYZD6EqasjzSc=";
    "catppuccin-macchiato-red-standard" = "sha256-70/i1S/imWIVlQJ5JrcaPZgGugzAmuY1+hlLAF265Hs=";
    "catppuccin-macchiato-maroon-standard" = "sha256-33or6fpwhKRjdZkJLIlzIzBrZb+YHvAcukeOucPTLUM=";
    "catppuccin-macchiato-peach-standard" = "sha256-q6MThSD8SC6fqic6xyQRRxe65BiEvhStq3BKmGJ+60I=";
    "catppuccin-macchiato-yellow-standard" = "sha256-qbHWFzQ8uS/D8QwC0nfSlxxwduSVYp6DaH8KR5v1p30=";
    "catppuccin-macchiato-green-standard" = "sha256-LgVzhQzKFUUaLe8scmBoysQOXJghMcNrs49Ertk0y8A=";
    "catppuccin-macchiato-teal-standard" = "sha256-5Tm1bnonLo9MYIW0fBOhncYWIJVF2pi+NbgAo6NUbEM=";
    "catppuccin-macchiato-sky-standard" = "sha256-99dO/iTgWnpIvRPXWlaTx5xd0P8pbbZO3CS9y0UxBLc=";
    "catppuccin-macchiato-sapphire-standard" = "sha256-kAT8ljzX7yLpQvmOLDfWz//6ybeysKZ5WdztKwj24WU=";
    "catppuccin-macchiato-blue-standard" = "sha256-JfmWGMaKyg0ci7E+DWOA8layL/UyIko69V77pOnS41k=";
    "catppuccin-macchiato-lavender-standard" = "sha256-Lx/M9oTly/PlIpOVHYJ/R3chmza0/Ylde+2RPbWLfk0=";
    "catppuccin-mocha-rosewater-standard" = "sha256-U6Jk4byCxm47kYvOY+tLwE6rj8kSE1vosUoCSJYKzKw=";
    "catppuccin-mocha-flamingo-standard" = "sha256-weUPpCMIcEL1ym/plgkljQBzJxhoZQigxzgo/IlcK9w=";
    "catppuccin-mocha-pink-standard" = "sha256-0nk/v1nZTrNTYKEBdJNMal+Ms2p81yKK2Y7pOBVwsuE=";
    "catppuccin-mocha-mauve-standard" = "sha256-QRZUhYcI7pC8+7oWGO8wAv7B+KrIyYYfZ0hPrAMQGKo=";
    "catppuccin-mocha-red-standard" = "sha256-/LJUje3xGcUwneKpCmnGtVFQivtnQ2Aj3WFLjvnnG2I=";
    "catppuccin-mocha-maroon-standard" = "sha256-0hLk8C/e549BRc7cr14Bo7chTqM29C7uZBrqm+7WhnI=";
    "catppuccin-mocha-peach-standard" = "sha256-o17pFJJ4vq/sTpFZE6HcP84UCxITag3H4f3/UOu08Ek=";
    "catppuccin-mocha-yellow-standard" = "sha256-WApc1qIYghTKuFkG+6zzpfzGdyvXphqo44selEWPiiE=";
    "catppuccin-mocha-green-standard" = "sha256-heGMo2OJgcjP+STx0m8Qm6LWtXZva3QTJkG+/4TGCJc=";
    "catppuccin-mocha-teal-standard" = "sha256-MllFbZvwGqI2rhHFObzoFyalb9nBgy8TQ2r5pKW+q5o=";
    "catppuccin-mocha-sky-standard" = "sha256-ntTkQuxQHXqQh9C19nIRmw/xt3yPumCgR7h1No9Hl9k=";
    "catppuccin-mocha-sapphire-standard" = "sha256-+lMeB7Rf/9H5m9cKFTQgFy2N3ollzLd3EtS77sqCg+M=";
    "catppuccin-mocha-blue-standard" = "sha256-Zk8hSIGhv6IOX7i9c2NhOU24f6X/G7iszYAvcBKzDRI=";
    "catppuccin-mocha-lavender-standard" = "sha256-htmfMYguWQsB8pN00REO6kDktfHTaAC2wlX+IAHq4N0=";
  };
  theme-name = "catppuccin-${flavor}-${accent}-standard";
in
pkgs.stdenv.mkDerivation {
  name = "Catppuccin GTK Theme";
  pname = theme-name;
  version = "1.0.6";

  src = pkgs.fetchzip {
    url = "https://github.com/VanillaDaFur/catppuccin-gtk/releases/download/v1.0.6/${theme-name}.zip";
    sha256 = hashs.${theme-name};
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/themes/
    cp -r ${theme-name} $out/share/themes/
    runHook postInstall
  '';

  meta = {
    description = "Continuation of Catppuccin GTK theme, ported to Nix";
    homepage = "https://github.com/VanillaDaFur/catppuccin-gtk";
  };
}
