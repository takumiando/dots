export PATH=~/bin:$PATH
export EDITOR=vim

case $(uname) in
	Darwin )
		export PATH=$PATH:/opt/homebrew/bin
		;;
	Linux )
		DIST=$(cat /etc/*-release | grep "^ID=" | cut -d '=' -f 2)
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
