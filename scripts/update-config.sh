#!/bin/sh

THISDIR=$(dirname $(readlink -f "$0"))
THISREPO=$(dirname "$THISDIR")
SOURCEDIR=$(dirname "$THISREPO")
CONFIGFILE="$THISDIR/repos"

listRepos () {
	DIRS=$(find "$SOURCEDIR" -mindepth 1 -maxdepth 1 -type d)
	for dir in $DIRS
	do
		if [ -d "$dir/.git" ] || git -C "$dir" rev-parse --git-dir > /dev/null 2>&1
		then
			echo "$dir"
		fi
	done
}

updateRepo () {
	DIR="$1"
	NAME=$(basename $DIR)
	GIT="git -C "$DIR""
	if [ -n "$($GIT status -s)" ]; then
		echo "Could not update repo $NAME, it has local changes!" >&2
		return -1;
	fi
	BRANCH="$($GIT rev-parse --abbrev-ref HEAD)"
	REMOTE="$($GIT rev-parse --abbrev-ref $BRANCH@{upstream} 2>/dev/null)"
	REV="$($GIT rev-parse HEAD)"
	echo "sources/$NAME:"
	echo "  Branch: $BRANCH"
	echo "  Revision: $REV"
	if [ -n "$REMOTE" ]; then
		echo "  Tracking: $REMOTE"
	fi
	for remote in $($GIT remote show)
	do
		REPO="$($GIT config --get remote.$remote.url)"
		echo "  Remote: $remote $REPO"
	done
}

updateAllRepos () {
	REPOS=$(listRepos)
	for repo in $(echo $REPOS | sort)
	do
		if [ "$repo" != "$THISREPO" ]; then
			updateRepo "$repo" || return $?
		fi
	done
}

CONFIG=$(updateAllRepos || exit $?)
echo "$CONFIG" > "$CONFIGFILE"
