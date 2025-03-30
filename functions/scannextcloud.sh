# Info
# In order to use this script you need to set "scannextcloud" as the FUNCTION variable in line 5 of the hotfolder.sh file
# this script utilizes RCLONE to upload a local file to a remote dir
# I use this script together with the holtfolder.sh script to move newly scanned documents from a network smb share to a nextcloud instance.
# In order to achieve this robustly I had to increase the sleep times to 15 seconds in hotfolder.sh file to allow the network scanner to update an existing file when scanning multiple pages into the same file.
# ------------------------ code ---------------------------------------------


if hash rclone 2>/dev/null; then	#check if rclone is installed
	echo Processing files...
	# allow another 5 seconds before starting to process
	sleep 5
	
	#inserting current date/time into the file name to make them individual
	cdate=$(date +"%Y%m%d_%H-%M")
	for f in *; do
		mv -- "$f" "$cdate"_"$f"
	done

	# Writing filenames in text file outside of the processing dir
	ls >../files-from.txt
	
	# rclone command
	# for a overview of available commands and their usage refer to https://rclone.org/commands/
	# decided to use the rclone "move" command, which will already delete the moved files (doesn't require me to do garbage collection)
	# note: works only for files / folders are not transferred. I think one has to use rclone "moveto" command in order to achieve this)
	# rclone copy --files-from ../files-from.txt -v ./ Nextcloud:/
	rclone move --files-from ../files-from.txt -v --delete-empty-src-dirs ./ Nextcloud:/
	
	# Post processing... doing the files and folder cleanup
	mv * ../out/	# move file into the out folder
	rm  -rf *		# delete content of processing folder
	rm ../files-from.txt 	# delete the previously created text file holding the file names
	
else	# if rclone is not installed
	echo rclone needs to installed and be accessible via standardpath >&2
fi
