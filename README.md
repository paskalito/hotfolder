# hotfolder - now also working with up to date Linux Systems :D
A shell script wihich provides you a hotfolder structure. And a modular way of loading you processing code.




# In short TL:DR

you wanna convert somefile into someotherfile.
With this you can trow your somefile into the "in" folder and wait for the someotherfile to appear in the "out" folder.

Also quiet cool to run on a network share by a server so suddenly anyone in the company is able to convert his TIF files into JPG.
Because EVERYONE knows how to copy file(s) into a folder.



# New exciting feautures
- Runs on your ubuntu - and possibly also mostly everywhere else (and on strange filesystems)
- Easily fill in at the very top what your hotfolder should do
- nice new explanations in the code

# Available Functios

```
# convert_pictures - Convert and Resize Pictures (uses ImageMagik)
# convert_video - Convert/Compress Videos (uses HandBrake_CLI)
# make_me_gif - Convert a bunge of picures into an animated gif (choose your outputsize) (uses ImageMagik)
# compress_pdf - Compress PDF's (uses Ghostscript)
# make_panorama - [EXPERIMENTAL] Stiches panorama Shots toghether into one Panorama Image (uses hugin)
# zip - Zip files (uses zip)
# convert_audio - Convert/Compress/Extract Audio Files (uses ffmpeg)
```


# Install

Download this repo
make "hofolder.sh" executable (`chmod +x /path/to/hofolder.sh`) and doubleclick it (depending on your system)
or run it in a terminal. (`sh /path/to/hofolder.sh`)


### Install from Terminal

````
git clone https://github.com/paskalito/hotfolder.git
chmod +x ./hotfolder/hotfolder.sh
sh ./hotfolder/hotfolder.sh
````

# what it does. / how it works

it makes 3 directories right on the level where the script is

waits for input to the "in" folder.

if you put files into "in" it will move them in the processing folder and cd into it.

So here you can run your code.

at the end you move whatever you have created to ../out
and clear the processing folder (rm *)
then you go up again
cd ..

# what is it usefull for

For anything thats easy to automate requires input files and you expect and outputfile at the end

examples
-Image Coversion (ImageMagick)
-Audio Conversion (ffmpeg)
-Panorama Stitching (Panotools)

I will uplaod all the functions for the usecases i have and develop.
You are Welcome to add yours.



