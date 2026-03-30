function fish_prompt
    alias echon "echo -n"
    echon (hostname)
    echon (set_color --bold red) '::'
    echon (set_color green) (echo $PWD | string replace $HOME '~')
    echon (set_color blue) '»' (set_color normal)
end