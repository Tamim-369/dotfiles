function inside
    set depth 2
    set path .

    for arg in $argv
        if string match -qr '^\d+$' -- $arg
            set depth $arg
        else
            set path $arg
        end
    end

    eza --tree -L$depth $path

end
