# Info
# In order to use this "function" need to set make_me_gif for the FUNCTION variabel in line 5 of the hotfolder.sh file
# You need to have ImageMagick installed on your system. (http://www.imagemagick.org/)


# choose desired width of the image (in pixel) if you don't want to resize or only resize height leave blank (usefull for panorama's)
IMAGEWIDTH=2200
# choose desired height of the image (in pixel) if you don't want to resize or only resize width leave blank
IMAGEHEIGHT=2200
# choose the delay you want between the pictures. ( i really don't know what the value stands for..) (they call it ticks..) (http://www.imagemagick.org/script/command-line-options.php#delay)
DELAY=5


# ------------------------ code ---------------------------------------------
if hash mogrify 2>/dev/null; then
	# generate date and time variabel for the output folders
	NOW=$(date +"%Y-%m-%d %H:%M")

	# the ImageMagick convert code
	mogrify -verbose -format jpg -resize ''$IMAGEWIDTH'x'$IMAGEHEIGHT'>' *
	# the ImageMagick code who converts the pictures into the animated gif
	convert -delay "$DELAY" * animated.gif
	# make a new dir for the files to be safed in
	mkdir ../out/Conversion-"$NOW"
	# move all the files of your choosen output filetype into that folder
	mv *.gif ../out/Conversion-"$NOW"/
	# delete the rest (former files is imageformat was changed) // cleanup the process folder
	rm *
	
else
	echo ERROR: Could not find ImageMagick >&2
	echo ImageMagick needs to installed and in standardpath for make_me_gif to work >&2
fi



