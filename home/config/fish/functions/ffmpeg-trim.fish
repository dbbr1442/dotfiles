function ffmpeg-trim --description "uses ffmpeg to trim media arg1 - start position arg2 - end position arg3 - c:v arg4 - c:a arg5 - file path"
    if test $argv[1] = "help"
        echo "ffmpeg-trim [start position] [end position] [c:v] [c:a] [file path]"
        return 0
    else
        command mv $argv[5] trim.tmp
        command ffmpeg -i trim.tmp -ss $argv[1] -to $argv[2] -c:v $argv[3] -c:a $argv[4] $argv[5]
        command rm trim.tmp
    end
end
