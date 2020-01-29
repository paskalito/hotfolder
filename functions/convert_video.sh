# Info
# In order to use this "function" need to set convert_video for the FUNCTION variabel in line 5 of the hotfolder.sh file
# You need to have HandBrakeCLI installed and in stadardpath

# choose name of the preset you wanna use
HANDBRAKEPRESET="High Profile"


# ------------------------ code ---------------------------------------------
# generate date and time variabel for the output folders
NOW=$(date +"%Y-%m-%d %H:%M")

if hash HandBrakeCLI 2>/dev/null; then
	for filename in *.*; do
		# the handbrake convert code
		# added nice to which starts the converting process in lowes priority so you can still use your computer
		# HandBrakeCLI -i "$filename" -o "${filename%.*}_converted.m4v" --preset="High Profile"
		nice -n 19 HandBrakeCLI -i "$filename" -o "${filename%.*}_converted.m4v" --preset="Fast 1080p30"
		mv "${filename%.*}_converted.m4v" ../out/
		rm "$filename"
	done
	
else
	echo ERROR: Could not find HandBrakeCLI >&2
	echo HandBrakeCLI needs to installed and in standardpath for convert_video to work >&2
fi



