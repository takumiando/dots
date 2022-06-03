append_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

append_path '/usr/local/sbin'
append_path '/usr/local/bin'
append_path '/usr/sbin'
append_path '/usr/bin'
append_path '/sbin'
append_path '/bin'

export PATH
export EDITOR=vi

case "$(uname)" in
	Darwin)
		export PATH=$PATH:/opt/homebrew/bin
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
