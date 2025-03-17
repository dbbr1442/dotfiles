function yt-dlp-preset --description "shortening for yt-dlp -x --audio-format flac --embed-metadata --embed-thumbnail which i use alot"
    command yt-dlp -x --audio-format flac --embed-metadata --embed-thumbnail $argv[1]
end
