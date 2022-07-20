append_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

append_path /usr/local/sbin
append_path /usr/local/bin
append_path /usr/sbin
append_path /usr/bin
append_path /sbin
append_path /bin
append_path ~/bin

case "$(uname)" in
    Darwin)
        append_path /opt/homebrew/bin
        ;;

    Linux)
        DIST=$(cat /etc/*-release | grep '^ID=' | cut -d '=' -f 2)
        case $DIST in
            debian )
                export DEBEMAIL="t-ando@advaly.co.jp"
                export DEBFULLNAME="Takumi Ando"
                ;;
            arch )
                ;;
            * )
                ;;
        esac
        ;;
esac

export PATH
export EDITOR=vi

if [ "$SHELL" = /bin/ash ] && type zsh > /dev/null 2>&1; then
    zsh
    exit
fi
