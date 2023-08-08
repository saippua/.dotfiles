if [ $(uname -r | sed -n 's/.*\( *Microsoft *\).*/\1/ip') ];
then
    echo "TMUX disabled on WSL by order of the Peaky Blinders."
else
    if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
      exec tmux new -A -s main
    fi
fi
