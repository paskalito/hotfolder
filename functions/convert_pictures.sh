# Info
# In order to use this "function" need to set convert_pictures.sh in line 36 in the hotfolder.sh
# You need to have ImageMagick installed on your system. (http://www.imagemagick.org/)

# choose one of the 200+ formats ImageMagick supports (http://www.imagemagick.org/script/formats.php)
OUTPUTFORMAT=png
# choose desired width of the image (in pixel) if you don't want to resize or only resize height leave blank (usefull for panorama's)
IMAGEWIDTH=2200
# choose desired height of the image (in pixel) if you don't want to resize or only resize width leave blank
IMAGEHEIGHT=2200


# ------------------------ code ---------------------------------------------
# generate date and time variabel for the outpur folders
NOW=$(date +"%Y-%m-%d %H:%M")

# the ImageMagick convert code
mogrify -verbose -format "$OUTPUTFORMAT" -resize ''$IMAGEWIDTH'x'$IMAGEHEIGHT'>' *

# make a new dir for the files to be safed in
mkdir ../out/Conversion-"$NOW"
# move all the files of your choosen output filetype into that folder
mv *."$OUTPUTFORMAT" ../out/Conversion-"$NOW"/
# delete the rest (former files is imageformat was changed) // cleanup the process folder
rm *
