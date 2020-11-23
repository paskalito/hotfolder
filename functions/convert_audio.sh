# Info
# In order to use this "function" need to set convert_audio for the FUNCTION variabel in line 5 of the hotfolder.sh file
# You need to have ffmpeg installed and in stadardpath

# choose one of the many formats ffmpeg supports (https://en.wikipedia.org/wiki/Libavcodec#Implemented_audio_codecs)
# Popular Formats are ogg,opus,wav,mp3,aac
# you can also use this to extract (and convert) the audio of video files.
OUTPUTFORMAT=ogg

# Define a desired constant bitrate in bits/sec
# Low Value = smaller files and less quality (96000) > for audiobooks
# High Value = bigger files and better quzialite (320000) > for "musically complex" files.
# 0 = Keep the bitrate of the original file (recomended if you want to convert filetype only)
BITRATE=0


# ------------------------ code ---------------------------------------------

if hash ffmpeg 2>/dev/null; then
	mkdir tmp
	for filename in *.*; do
		# the ffmpeg convert code
		# ffmpeg -y -i filename.mp3 -b:a 69000 filename.ogg
		nice -n 19 ffmpeg -y -i "$filename" -b:a "$BITRATE" tmp/"${filename%.*}."$OUTPUTFORMAT""
		mv tmp/"${filename%.*}."$OUTPUTFORMAT"" ../out/
		rm "$filename"
	done
	
else
	echo ERROR: Could not find ffmpeg >&2
	echo ffmpeg needs to installed and in standardpath >&2
fi

rm -rf tmp


