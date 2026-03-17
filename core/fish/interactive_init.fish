function rebuild \
    -a host \
    -d "Rebuilds the current NixOS configuration for the specified target host."

    if [ -n $host ]
        sudo nixos-rebuild switch --flake /etc/nixos#$host
    else
        sudo nixos-rebuild switch --flake /etc/nixos
    end
end

function activate \
    -a venv_dir \
    -d "Activates the specified virtual environment directory, or otherwise cwd/.venv"
    
    if test "$venv_dir" = ""
        source ./.venv/bin/activate
    else
        source $venv_dir/bin/activate
    end
end