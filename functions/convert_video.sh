# Info
# In order to use this "function" need to set convert_pictures.sh in line 36 in the hotfolder.sh
# You need to have HandBrakeCLI installed and in stadardpath

# choose name of the preset you wanna use
HANDBRAKEPRESET="High Profile"
# choose desired width of the image (in pixel) if you don't want to resize or only resize height leave blank (usefull for panorama's)
#IMAGEWIDTH=2200
# choose desired height of the image (in pixel) if you don't want to resize or only resize width leave blank
#IMAGEHEIGHT=2200


# ------------------------ code ---------------------------------------------
# generate date and time variabel for the output folders
NOW=$(date +"%Y-%m-%d %H:%M")




for filename in *.*; do
	# the handbrake convert code
	HandBrakeCLI -i "$filename" -o "${filename%.*}_converted.m4v" --preset="High Profile"
	mv "${filename%.*}_converted.m4v" ../out/
	rm "$filename"
done

# make a new dir for the files to be safed in
#mkdir ../out/Conversion-"$NOW"
# move all the files of your choosen output filetype into that folder
#mv *."$OUTPUTFORMAT" Conversion-"$NOW"/
# delete the rest (former files is imageformat was changed) // cleanup the process folder
#rm *
