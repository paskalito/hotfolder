# Info
# In order to use this "function" need to set zip for the FUNCTION variabel in line 5 of the hotfolder.sh file
# You need to have zip installed on your system.

# ------------------------ code ---------------------------------------------


if hash zip 2>/dev/null; then
	# generate date and time variabel for the output folders
	NOW=$(date +"%Y-%m-%d %H:%M")

	# the zip command
	zip -r zip-"$NOW".zip *

	
	# move all the zip-files into that folder
	mv *.zip ../out/
	# delete the rest (former files) // cleanup the process folder
	rm  -rf *
	
else
	echo ERROR: Could not find zip >&2
	echo zip needs to installed and in standardpath >&2
fi



