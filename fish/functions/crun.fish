function crun
    set filename $argv[1]
    gcc ./$filename.c -o $filename && ./$filename
end
