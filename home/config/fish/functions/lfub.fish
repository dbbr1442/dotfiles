function lfub --wraps lf
    #command sh "$HOME/.config/fish/functions/other/lfub" $argv
    
    set UB_PID 0
    set UB_SOCKET ""
    set UEBERZUG_TMP_DIR "/tmp"

    function cleanup
        # 3>&-
        command ueberzugpp cmd -s "$UB_SOCKET" -a exit
    end

    if [ ! -e "$HOME/.cache/lf" ] 
        command mkdir -p "$HOME/.cache/lf"
    end

    set UB_PID_FILE "$UEBERZUG_TMP_DIR/.$(uuidgen)"
    command ueberzugpp layer --silent --no-stdin --use-escape-codes --pid-file "$UB_PID_FILE"
    set UB_PID $(cat "$UB_PID_FILE")
    command rm "$UB_PID_FILE"
    set UB_SOCKET "$UEBERZUG_TMP_DIR/ueberzugpp-$UB_PID.socket" 
    set -x UB_PID $UB_PID
    set -x UB_SOCKET $UB_SOCKET
    trap cleanup HUP INT QUIT TERM EXIT
    if test -e "/tmp/lfcdfile.tmp"
        lf -print-last-dir "$argv" > "/tmp/lfcdfile.tmp"
    else 
        lf "$argv"
    end

    command pkill ueberzugpp

end
