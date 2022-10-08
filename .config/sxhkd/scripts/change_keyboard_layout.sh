#/bin/sh

layout=$(setxkbmap -query | grep layout | cut -d ':' -f 2 | sed 's/^[ \t]*//')

if [ $layout = 'es' ]; then
	setxkbmap -layout us -variant altgr-intl
else
	setxkbmap es
fi
