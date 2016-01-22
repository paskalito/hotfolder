# hotfolder
A shell script wihich provides you a hotfolder structure. And a modular way of loading you processing code.


# Install

Download "hofolder.sh"
make it executable (chmod +x /path/to/hofolder.sh)
doubleclick it / run it. (sh /path/to/hofolder.sh)

# what it does.

it makes 3 directories right on the lever where the script is

waits for input to the "in" folder.

if you put files into it it will move them in the processing folder and cd into it.

So here you can run your code.

at the end you move whater you have created to ../out
and clear the processing folder (rm *)
then you go up again
cd ..

# what is that usefull for

For anything thats easy to automate requires input files and you expect an output fom it

examples
Image Coversion (ImageMagick)
Audio Conersion (???)
Panorama Stitching (Panotools)

I will uplaod all the functions for the usecases i have and develop.


# In short

you wanna convert somefile into someotherfile.
With this you can trow your somefile into the in folder and wait for the someotherfile to appear in the our folder.

Also quiet cool to run on a network share by a server so suddenly anyone in the company is able to convert his mp3 files into ogg.
Because EVERYONE knows how to copy file(s) into a folder.

