#!/bin/sh

if [ "$(echo $0 | head -c1)" = "/" ]
then
	THISDIR=$(dirname "$0")
else
	THISDIR=$(dirname "$PWD/$0")
fi
#THISDIR=$(dirname $(readlink -f "$0"))
THISREPO=$(dirname "$THISDIR")
SOURCEDIR=$(dirname "$THISREPO")
ROOTDIR=$(dirname "$SOURCEDIR")
CONFIGFILE="$THISDIR/repos"

echo "THISDIR=$THISDIR"
echo "ROOTDIR=$ROOTDIR"

applyRepo () {
	REPO="$1"
	BRANCH="$2"
	REVISION="$3"
	TRACKING="$4"
	shift 4
	DIR="$ROOTDIR/$REPO"
	mkdir -p "$DIR"
	GIT="git -C $DIR"

	if [ ! -d "$DIR/.git" ]
	then
		echo "Initializing git repo in $REPO in directory $DIR"
		$GIT init >/dev/null
	fi

	REMOTES=$($GIT remote show -n)
	while [ "$#" -ge "2" ]
	do
		NAME="$1"
		URL="$2"
		shift 2
		if ! (echo "$REMOTES" | grep "$NAME" >/dev/null)
		then
			echo "Adding remote $NAME to $REPO"
			$GIT remote add "$NAME" "$URL" >/dev/null
		else
			ORIG_URL=$($GIT config --get remote.$NAME.url)
			if [ "$ORIG_URL" != "$URL" ]
			then
				echo "Changing remote $NAME in $REPO from $ORIG_URL to $URL"
				$GIT remote set-url "$NAME" "$URL" >/dev/null
			fi
		fi
		echo "Fetching $REPO from remote $NAME..."
		$GIT fetch "$NAME" >/dev/null 2>&1
	done

	if [ -n "$BRANCH" ] && [ "$BRANCH" != "HEAD" ]
	then
		$GIT checkout -b "$BRANCH" >/dev/null 2>&1
	fi

	if [ -n "$TRACKING" ]
	then
		$GIT branch -u "$TRACKING" >/dev/null 2>&1
	fi

	if [ -n "$REVISION" ] && [ "$($GIT rev-parse HEAD)" != "$REVISION" ]
	then
		$GIT checkout "$REVISION" >/dev/null 2>&1
	fi
}

parseConfigFile () {
	REPO=""
	BRANCH=""
	REVISION=""
	TRACKING=""
	REMOTE=""
	while IFS= read -r line
	do
		if [ "${#line}" -lt 2 ]
		then
			continue
		fi
		PREFIX=$(echo "$line" | head -c2)
		if [ "$PREFIX" = "  " ]
		then
			CMD=$(echo "$line" | sed 's/^  \([A-Z][a-z]*\):.*$/\1/')
			ARGS=$(echo "$line" | sed 's/^  [A-Z][a-z]*:[ \t]*\(.*\)$/\1/')
			case "$CMD" in
			'Branch')
				BRANCH="$ARGS"
				;;
			'Revision')
				REVISION="$ARGS"
				;;
			'Tracking')
				TRACKING="$ARGS"
				;;
			'Remote')
				REMOTE="$REMOTE $ARGS"
				;;
			esac
		else
			if [ -n "$REPO" ]
			then
				applyRepo "$REPO" "$BRANCH" "$REVISION" "$TRACKING" $REMOTE
			fi
			REPO=$(echo "$line" | sed 's/\(.*\):/\1/')
			BRANCH=""
			REVISION=""
			TRACKING=""
			REMOTE=""
		fi
	done < "$CONFIGFILE"
	if [ -n "$REPO" ]
	then
		applyRepo "$REPO" "$BRANCH" "$REVISION" "$TRACKING" $REMOTE
	fi
}

setupBuildDir () {
	CONFDIR="$ROOTDIR/build/conf"
	mkdir -p "$CONFDIR"
	ln -s "$THISDIR/bblayers.conf" "$CONFDIR/bblayers.conf"
	ln -s "$THISDIR/local.conf" "$CONFDIR/local.conf"
}

parseConfigFile
setupBuildDir
