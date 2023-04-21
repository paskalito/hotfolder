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

### In case you get "path not found error"
try to launch it with `bash` instead of `sh`
`bash /path/to/hofolder.sh`

### Configure Autostart the Script with `cron` and `flock`
type `crontab -e` in your terminal

paste

````
*/1 * * * * /usr/bin/flock -n /tmp/fcj.lockfile sh /path/to/hotfolder/hotfolder.sh
````
at the end of the file and Save.

this starts the script every minute, but wil not start it more than one time. (basically it will always run and resart within one minute if the process crashes)

make sure cron is running
`sudo service cron status`

# what it does. / how it works

it makes 3 directories right on the level where the script is

waits for input to the "in" folder.

if you put files into "in" it will move them in the processing folder and cd into it.

So here you can run your code.

at the end you move whatever you have created to ../out
and clear the processing folder (rm *)
then you go up again
cd ..

# what is it useful for

For anything that's easy to automate requires input files and you expect and outputfile at the end

examples
-Image Coversion (ImageMagick)
-Audio Conversion (ffmpeg)
-Panorama Stitching (Panotools)

I will uplaod all the functions for the usecases i have and develop.
You are Welcome to add yours.


# Design guidelines for Developers

1. KISS - Keep it simple and Stupid. Always ask yourself: Is there an easier way to archieve my goal?
2. Keep everything that you might create during your processing within the processing-folder. - This is to ensure a clean "rootstructure" at any time/case.  
2.1 Only Move your final Product to ../out  
2.2 Make sure to clear out the processing folder when you're done. So everyone has always a clean place to start from.  
3. Put all the Variables relvant to your function, that another user needs or might want to change above the ----code----- line of your function file.
4. Comment your Code.  
4.1 Give all the information an enduser needs to run your function meaningfull in first few lines of the function-file. (including known limitations)

