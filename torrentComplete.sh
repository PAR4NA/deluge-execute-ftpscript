#!/bin/bash
torrentid=$1
torrentname=$2
torrentpath=$3

HOST='HOSTNAME.com'
USER='USER'
PASS='PASSWORD'
STOREAGEDIR='/media/sde1/home/user/private/Storage'

echo "Torrent Details: ***" $torrentname "***" $torrentpath "***" $torrentid "***"  >> ~/execute_script.log

if [ "$STOREAGEDIR/What.cd" == "$torrentpath" ]
then
echo "This is a what.cd torrent, sending with FTP" >> ~/execute_script.log
lftp -u $USER,$PASS $HOST -e "mirror -P4 -R \"$torrentpath/$torrentname\" /Music/What.cd/; quit"
elif [ "$STOREAGEDIR/AwesomeHD" == "$torrentpath" ]
then
echo "This is an AwesomeHD torrent, sending with FTP" >> ~/execute_script.log
lftp -u $USER,$PASS $HOST -e "mirror -P4 -R \"$torrentpath/$torrentname\" /Subsonic/Movies/Uncategorized/; quit"
elif [ "$STOREAGEDIR/TV Shows" == "$torrentpath" ]
then
echo "This is a TV Show torrent, skipping" >> ~/execute_script.log


fi
