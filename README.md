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


# Install

Download this repo
make "hofolder.sh" executable (chmod +x /path/to/hofolder.sh)
doubleclick it or run it in a terminal. (sh /path/to/hofolder.sh)

# what it does. / how it works

it makes 3 directories right on the level where the script is

waits for input to the "in" folder.

if you put files into "in" it will move them in the processing folder and cd into it.

So here you can run your code.

at the end you move whatever you have created to ../out
and clear the processing folder (rm *)
then you go up again
cd ..

# what is that usefull for

For anything thats easy to automate requires input files and you expect and outputfile at the end

examples
-Image Coversion (ImageMagick)
-Audio Conversion (???)
-Panorama Stitching (Panotools)

I will uplaod all the functions for the usecases i have and develop.



