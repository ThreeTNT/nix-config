import subprocess

flavors = [ "latte", "frappe", "macchiato", "mocha" ]
accents = [ "rosewater", "flamingo", "pink", "mauve", "red", "maroon", "peach", "yellow", "green", "teal", "sky", "sapphire", "blue", "lavender" ]
url = "https://github.com/VanillaDaFur/catppuccin-gtk/releases/download/v1.0.6/{name}.zip"

def get_args(name):
    return [
        "nix-prefetch-url", 
        url.format(name=name), 
        "--type", "sha256",
        "--unpack"
    ]

for flavor in flavors:
    for accent in accents:
        name = f"catppuccin-{flavor}-{accent}-standard"
        res = subprocess.run(get_args(name), capture_output=True)
        res = res.stdout.decode().strip()
        res = subprocess.run(["nix", "hash", "convert", "--hash-algo", "sha256", res], capture_output=True)
        res = res.stdout.decode().strip()
        print(f"\"{name}\" = \"{res}\";")