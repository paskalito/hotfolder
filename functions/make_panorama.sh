
NOW=$(date +"%Y-%m-%d %H:%M")

pto_gen * -o project.pto

cpfind --multirow -o project.pto project.pto

celeste_standalone -i project.pto -o project.pto

# not working
# ptoclean -v --output project.pto project.pto

autooptimiser -a -l -s -o project.pto project.pto

pano_modify -o project.pto --center --straighten --canvas=AUTO --crop=AUTO project.pto

nona -m TIFF_m -o project project.pto

enblend -o project.jpg *.tif

mv project.jpg ../out/panorama-"$NOW".jpg

rm *
