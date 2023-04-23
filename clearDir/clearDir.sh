#!/bin/bash

echo "enter the directory which you want to clear"
read Dir1

path=$(basename $Dir1) 

echo "enter the directory where you want to save the tar file"
read Dir2

echo "Do you really want to clear the directory? y/n"
read usrResp

if [ $usrResp = 'y' ] || [ $usrResp = 'Y' ]
then 
	#tar -zcvf /home/$USER/$Dir2/file.tar.gz /home/$USER/$Dir1
	sudo tar -zcvf $Dir2/$path.tar.gz $Dir1
	#find /home/$USER/$Dir1 -type f -delete
	sudo find $Dir1 -type f -delete

fi

#tree -fJ /home/balaram/pointNode

dir_array_point=(/home/balaram/pointNode/fourRelay/multiplierSlave /home/balaram/pointNode/fourRelay/Node /home/balaram/pointNode/fourRelay/Touch/BS814C /home/balaram/pointNode/fourRelay/Touch/BS814C_Neo /home/balaram/pointNode/fourRelay/Touch/BS814C_Neo_Int /home/balaram/pointNode/HighCapacity/oneRelay/Touch/BS814C_Neo /home/balaram/pointNode/HighCapacity/twoRelay/Touch/BS814C_Neo /home/balaram/pointNode/masterTWW/pointNode/fourTouch/BS814C /home/balaram/pointNode/masterTWW/pointNode/fourTouch/BS814C_Neo /home/balaram/pointNode/masterTWW/pointNode/oneTouch/BS814C /home/balaram/pointNode/masterTWW/pointNode/oneTouch/BS814C /home/balaram/pointNode/masterTWW/pointNode/threeTouch/BS814C /home/balaram/pointNode/masterTWW/pointNode/threeTouch/BS814C_Neo /home/balaram/pointNode/masterTWW/pointNode/twoTouch/BS814C /home/balaram/pointNode/masterTWW/pointNode/twoTouch/BS814C_Neo /home/balaram/pointNode/oneRelayFB/Touch/BS814C_Neo /home/balaram/pointNode/oneRelay/multiplierSlave /home/balaram/pointNode/oneRelay/Node /home/balaram/pointNode/oneRelay/Touch/BS814C /home/balaram/pointNode/oneRelay/Touch/BS814C_Neo /home/balaram/pointNode/oneRelay/Touch/BS814C_Neo_Int /home/balaram/pointNode/twoRelay/multiplierSlave /home/balaram/pointNode/twoRelay/Node /home/balaram/pointNode/twoRelay/Touch/BS814C /home/balaram/pointNode/twoRelay/Touch/BS814C_Neo /home/balaram/pointNode/twoRelay/Touch/BS814C_Neo_Int /home/balaram/pointNode/threeRelay/multiplierSlave /home/balaram/pointNode/threeRelay/Node /home/balaram/pointNode/threeRelay/Touch/BS814C /home/balaram/pointNode/threeRelay/Touch/BS814C_Neo /home/balaram/pointNode/threeRelay/Touch/BS814C_Neo_Int)

dir_array_bldc=(/home/balaram/bldcDimmer/Node /home/balaram/bldcDimmer/Touch/BS814C_Neo)

testcases_dir_path="/home/balaram/Testcases_8266"
# files_to_move_arr is the array containing the directories of all the files contained in the testcases path
mapfile -t files_to_move_arr < <(find "$testcases_dir_path" -type f)

for file_dir in "${files_to_move_arr[@]}"; do

	if [ "$(basename "$file_dir")" = "PointNode_testcases.ods" ]
	then

		for folder in "${dir_array_point[@]}"; do
	        	cp "$file_dir" "$folder"
    
		done 
		
	elif [ "$(basename "$file_dir")" = "CapacitiveFanDimmer_testcases.ods" ]
	then 
	
		for folder in "${dir_array_bldc[@]}"; do
	        	cp "$file_dir" "$folder"
    
		done 
	
	fi
done










































