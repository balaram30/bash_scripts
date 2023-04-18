#!/bin/bash

echo "enter the directory which you want to clear"
read Dir1

echo "enter the directory where you want to save the tar file"
read Dir2

echo "Do you really want to clear the directory? y/n"
read usrResp

if [ $usrResp = 'y' ] || [ $usrResp = 'Y' ]
then 
	#tar -zcvf /home/$USER/$Dir2/file.tar.gz /home/$USER/$Dir1
	sudo tar -zcvf $Dir2/file.tar.gz $Dir1
	#find /home/$USER/$Dir1 -type f -delete
	sudo find $Dir1 -type f -delete

elif [ $usrResp = 'n' ] || [ $usrResp = 'N' ] 
then
	echo "files not deleted"
	
else
	echo "Invalid input"

fi
