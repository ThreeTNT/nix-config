set -x SSH_AUTH_SOCK "$HOME/.bitwarden-ssh-agent.sock"

if test $SSH_CONNECTION
    set -x EDITOR "hx";
else
    set -x EDITOR "codium";
end
