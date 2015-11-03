#!/bin/bash
torrentid=$1
torrentname=$2
torrentpath=$3

readonly BASE="/home/pddenhar/Storage"

readonly HOST='HOSTNAME.COM'
readonly USER='USERNAME' # Only public key auth is used

echo "Torrent Details: ***" $torrentname "***" $torrentpath "***" $torrentid "***"  >> ~/execute_script.log
echo "./torrentComplete.sh $1 \"$2\" \"$3\"" >> ~/execute_script.log

if [ "$BASE/ubuntu" == "$torrentpath" ]
then
    echo "This is an Ubuntu torrent, sending with rsync" >> ~/execute_script.log
	savepath="isos/ubuntu"
elif [ "$BASE/mint" == "$torrentpath" ]
then
    echo "This is a mint torrent, sending with rsync" >> ~/execute_script.log
	savepath="isos/mint"
elif [ "$BASE/fedora" == "$torrentpath" ]
then
    echo "This is a fedora torrent, sending with rsync" >> ~/execute_script.log
	savepath="isos/fedora"
fi

if [ -z "$savepath" ]
then
	echo "No match found for torrent" >> ~/execute_script.log
else
        until rsync -v --protect-args -ah -e ssh "$torrentpath/$torrentname" "$USER@$HOST:/mnt/tank/Storage/$savepath"
	do
		echo "Rsync failed, trying again in 30s"
		sleep 30;
	done
fi
