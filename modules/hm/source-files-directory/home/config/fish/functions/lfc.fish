# Change working dir in fish to last dir in lf on exit (adapted from ranger).
#
# You may put this file to a directory in $fish_function_path variable:
#
#     mkdir -p ~/.config/fish/functions
#     ln -s "/path/to/lfcd.fish" ~/.config/fish/functions
#
# You may also like to assign a key (Ctrl-O) to this command:
#
#     bind \co 'set old_tty (stty -g); stty sane; lfcd; stty $old_tty; commandline -f repaint'
#
# You may put this in a function called fish_user_key_bindings.

function lfc --wraps="lf" --description="lf - Terminal file manager (changing directory on exit using lfub)"
    # `command` is needed in case `lfcd` is aliased to `lf`.
    # Quotes will cause `cd` to not change directory if `lf` prints nothing to stdout due to an error.
    command touch "/tmp/lfcdfile.tmp";
    lfub "$argv"
    builtin cd $(cat "/tmp/lfcdfile.tmp")
    command rm -f "/tmp/lfcdfile.tmp"

end
