import subprocess

flavors = [ "latte", "frappe", "macchiato", "mocha" ]
accents = [ "rosewater", "flamingo", "pink", "mauve", "red", "maroon", "peach", "yellow", "green", "teal", "sky", "sapphire", "blue", "lavender" ]

def fetch_hashes(links: list[str]) -> dict[str, str]:
    out = dict()

    for link in links:
        res = subprocess.run(
            args=[
                "nix-prefetch-url", 
                link,
                "--type", "sha256",
                "--unpack"
            ], capture_output=True) \
            .stdout.decode().strip()
        res = subprocess.run(
            [
                "nix", 
                "hash", 
                "convert", 
                "--hash-algo", 
                "sha256", 
                res
            ], capture_output=True) \
            .stdout.decode().strip()
        out[link] = res

    return out

if __name__ == "__main__":
    flavors = [x.capitalize() for x in flavors]
    base_url = "https://github.com/catppuccin/kde/releases/download/v0.2.6/{name}.tar.gz"
    links = [
        base_url.format(name = f"{x}-color-schemes")
        for x in flavors
    ]
    res = fetch_hashes(links)
    res = {f: x for f, x in zip(flavors, res.values())}

    import json
    print(json.dumps(res, indent=4))