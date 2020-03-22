#!/bin/bash

# What should this instance of hotfolder do?
# Fill in the name of the function you want to use
FUNCTION=make_panorama

# The Following options are available:

# convert_pictures - Convert and Resize Pictures (uses ImageMagik)
# convert_video - Convert/Compress Videos (uses HandBrake_CLI)
# make_me_gif - Convert a bunge of picures into an animated gif (choose your outputsize) (uses ImageMagik)
# compress_pdf - Compress PDF's (uses Ghostscript)
# make_panorama - [EXPERIMENTAL] Stiches panorama Shots toghether into one Panorama Image (uses hugin)




# ------------------------ code (Do not edit below) ---------------------------------------------

# Finding path to itself
RELPATH=$(dirname "$0")

# cd into it
cd "$RELPATH"

#make 3 new directories
mkdir in out processing


# mechanism to restart converting videos if script was aborted(computer shutdown)
FOLDERSIZE=`du -s processing | cut -f1`

# find processing/ -type f -iname *_converted* -exec rm -f {} \;
find processing/ -type f \( -name '*_converted*' -or -name '*_compressed*' \) -exec rm -f {} \;
mv processing/* in



#open a loop
while :
do


if ! [ "$(ls -A in)" ]; then
	echo 'The "in" Folder is Empty'
	# to reduce processing load lets wait some seconds till we check again.	
	sleep 5
else
	echo 'Oh something is in the "in" Folder let us watch it more closely'
	#check the size of folder in, wait 5 second check again.
	FOLDERSIZE1=`du -s in | cut -f1`
	echo $FOLDERSIZE1
	sleep 10
	FOLDERSIZE2=`du -s in | cut -f1`
	echo $FOLDERSIZE2
	sleep 2

		# if the first and secod time the foldersize didn't change and is grater than 0 start processing (we then assume that the copying into the in folder is finished)
		if [ "$FOLDERSIZE1" -eq "$FOLDERSIZE2" ] && [ "$FOLDERSIZE2" -gt 0 ]; then
			# Start Processing > Enter your code here
		  
			# move content from in folder to processing folder
			mv in/* processing
			# go into processing folder / make it current path
			cd ./processing
			  
			# load a script from functions / here it actually starts the processing of the data
			# replaced source with . for bigger compatibility
			. "$RELPATH"/functions/"$FUNCTION".sh

			# go up one level (because in the rest of the script we assume to be at the base level of our folderstructure)
			cd ..

		else
			# this is somehow obsolete now but if there was a file with size 0 placed in the in folder this is where we would land.
			echo Size of in is still changing we assume someone is still copying their data into it.
			echo OR someone placed a file with size 0 in the in folder
		fi
fi

  
done
