#!/bin/bash
torrentid=$1
torrentname=$2
torrentpath=$3

HOST='HOSTNAME.com'
USER='USER'

echo "Torrent Details: ***" $torrentname "***" $torrentpath "***" $torrentid "***"  >> ~/execute_script.log

if [ "/media/Storage/Ubuntu" == "$torrentpath" ]
then
    echo "This is an ubuntu torrent, sending with rsync" >> ~/execute_script.log
	rsync -ah -e ssh "$torrentpath/$torrentname" "$USER@$HOST:/mnt/tank/Ubuntu" &>> ~/execute_script.log
elif [ "/media/Storage/Mint" == "$torrentpath" ]
then
    echo "This is an mint torrent, sending with rsync" >> ~/execute_script.log
    rsync -ah -e ssh "$torrentpath/$torrentname" "$USER@$HOST:/mnt/tank/Mint" &>> ~/execute_script.log
elif [ "/media/Storage/Fedora" == "$torrentpath" ]
then
    echo "This is a Fedora torrent, sending with rsync" >> ~/execute_script.log
    rsync -ah -e ssh "$torrentpath/$torrentname" "$USER@$HOST:/mnt/tank/Fedora" &>> ~/execute_script.log
fi
