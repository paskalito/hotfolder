#!/bin/bash

# Finding path to itself
RELPATH=$(dirname "$0")

# cd into it
cd "$RELPATH"

#make 3 new directories
mkdir in out processing




#open a loop
while :
do
  #check the size of folder in, wait 5 second check again.
  FOLDERSIZE1=`du -s in | cut -f1`
  echo $FOLDERSIZE1
  sleep 2
  FOLDERSIZE2=`du -s in | cut -f1`
  echo $FOLDERSIZE2
  sleep 2

  # if the first and secod time the foldersize didn't change and is grater than 0 start processing
	if [ "$FOLDERSIZE1" -eq "$FOLDERSIZE2" ] && [ "$FOLDERSIZE2" -gt 0 ]; then
  # Start Processing > Enter your code here
  
  # move content from in folder to processing folder
  mv in/* processing
  # go into processing folder / make it current path
  cd ./processing
  
  # load a script from functions / here it actually starts the processing of the data
  source "$RELPATH"/functions/make_panorama.sh

  # go up one level
  cd ..

  else
  # if folder is empty or something is being copied into it. (within the last 5 sec it changed it's size)
  # This is what get's executed while "waiting".
  echo nothing here
  fi
done
