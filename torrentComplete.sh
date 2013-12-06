#!/bin/bash
torrentid=$1
torrentname=$2
torrentpath=$3

HOST='HOSTNAME.com'
USER='USER'
PASS='PASSWORD'

echo "Torrent Details: ***" $torrentname "***" $torrentpath "***" $torrentid "***"  >> ~/execute_script.log

if [ "/media/sde1/home/spammandan/private/Storage/What.cd" == "$torrentpath" ]
then
	echo "This is a what.cd torrent, sending with FTP" >> ~/execute_script.log
		lftp -u $USER,$PASS $HOST -e "mirror -P4 -R \"$torrentpath/$torrentname\" /Music/What.cd/; quit"  &>> ~/execute_script.log
elif [ "/media/sde1/home/spammandan/private/Storage/AwesomeHD" == "$torrentpath" ]
then
	echo "This is an AwesomeHD torrent, sending with FTP" >> ~/execute_script.log
	if [ -f "$torrentpath/$torrentname" ]
	then
		echo "     Torrent is a single file" >> ~/execute_script.log
                lftp -u $USER,$PASS $HOST -e "cd /Subsonic/Movies/Uncategorized/; put \"$torrentpath/$torrentname\"; quit" &>> ~/execute_script.log
	else
		echo "     Torrent is a folder" >> ~/execute_script.log
		lftp -u $USER,$PASS $HOST -e "mirror -P4 -R \"$torrentpath/$torrentname\" /Subsonic/Movies/Uncategorized/; quit" &>> ~/execute_script.log
	fi
elif [ "/media/sde1/home/spammandan/private/Storage/TV Shows" == "$torrentpath" ]
then
        echo "This is an TV Show torrent, sending with FTP" >> ~/execute_script.log
        if [ -f "$torrentpath/$torrentname" ]
        then
                echo "     Torrent is a single file" >> ~/execute_script.log
                lftp -u $USER,$PASS $HOST -e "cd Subsonic/TV\ Shows/Uncategorized/; put \"$torrentpath/$torrentname\"; quit" &>> ~/execute_script.log
        else
                echo "     Torrent is a folder" >> ~/execute_script.log
                lftp -u $USER,$PASS $HOST -e "mirror -P4 -R \"$torrentpath/$torrentname\" \"/Subsonic/TV\ Shows/Uncategorized/\"; quit" &>> ~/execute_script.log
        fi

fi
