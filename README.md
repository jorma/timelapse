Timelapse
=========

Jorma's Timelapse Scripts: These scripts allow you to automate the process of stitching together still frames to make daily timelapse movies using Apple's Quicktime Pro. They use any web cam image that is on the Internet and can be accessed directly (must be able to view/download the image directly). For best results, web cams that update every minute provide better/smoother movies than those that update less frequently. The scripts are configured to 1) download the images every minute, 2) stitch them into a movie once a day (or whenever desired) 3) save the original image files and movie into an archives folder. You can see an example of the scripts in action on my site http://halfdome.net

Copyright (C) 2014 - Jorma Rodieck

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation - http://www.gnu.org/licenses/gpl.html

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

#################################	
WARNING: Although the scripts are not complicated to set up and use, it is recommended you have a basic understanding of working on the command line to use these scripts. Command line tools are powerful, if you don't know what you are doing you can quickly do serious damage to your computer.

#################################	
Standard Disclaimer: These scripts are intended for general use and no warranty is implied for suitability to any given task. I hold no responsibility for your setup or any damage done while using/installing/modifing this script.

#################################	
Requirements:

1) Basic knowledge of working on the command line.
2) A Mac. These scripts will not run on Windows. I recommend a Mac Mini if you are going to have these scripts running 24/7, but any Mac should work. These are all tested using Mavericks, but an older Mac OS should work too.

Setup: The programs below need to be installed for the scripts to run. All are free except Quicktime Pro which is $30.

1) Quicktime Pro: http://store.apple.com/us/product/D3380Z/A/quicktime-7-pro-for-mac-os-x ($30)

2) Xcode https://itunes.apple.com/us/app/xcode/id497799835?mt=12 (free)

3) Homebrew http://brew.sh (free ~ install using the command shown on the brew.sh homepage)

4) Wget https://www.gnu.org/software/wget/ (free - install using the commmand 'brew install wget')

5) ImageMagick http://www.imagemagick.org (free ~ install with Homebrew using the command 'brew install ImageMagick')

6) jpeginfo https://github.com/tjko/jpeginfo (free ~ install using the command 'brew install -v jpeginfo')

7) php (should already be installed by default on your Mac)

8) CronniX https://code.google.com/p/cronnix/ (free)

9) Plain text editor of your choice (not MS Word!). I recommend either Sublime (free to try or $70 to buy - http://www.sublimetext.com), Textmate ($55 - http://macromates.com), or TextWrangler (free! - https://itunes.apple.com/us/app/textwrangler/id404010395?mt=12)

#################################	
Instructions:

1) Install all of the above applications.

2) Copy the script files into a folder called 'dev' at the root of your home (user) folder. You can put them anywhere you like, but you will need to change the paths in the script files to match the new location if you put them elsewhere. The camData folder is where your cam images, movies, archives, credits, temp images, and temp movies are stored. I used the NPS Denali 'Alaska Railroad Depot' web cam as a demo for the scripts, but you can replace this cam url with any cam you like.

3) Configure Cronnix to run the scripts at the intervals listed below (see CronniX_Ex.png screenshot in resources folder for example):
	a) Run the 01_download.sh script every minute
	b) Run the 02a_transferCreateRename.sh script every day at 9pm (or whenever you would like it to run)
	c) Run the 04_archive.sh script at 11:55pm (or whenever you like it to run).
	d) Run the empty_trash.sh script at midnight (or whenever you like it to run).
	
4) Modify the credits.psd file in timelapse/resources as desired to create your own credits. Use the existing credits images as an example of what to create.

#################################	
Description of Script Files:

01_download.sh : This shell scripts should run every minute (or whatever desired frequency). This script downloads the web cam image and renames it to the desired name with date and time appended.

02a_transferCreateRename.sh : Runs once a day. This script calls other the other scripts (02b_tranfer.sh, 02c_create_movie.scpt and 02d_rename.php). It is created so that only one entry is needed in Cronnix and not seperate entries for each script.

02b_tranfer.sh : This script removes corrupted images that have been downloaded/saved, removes night time images (adjust as needed), copies images to the temp_images directory, and resizes the copied images (adjust as needed).

02c_create_movie.scpt : This AppleScript creates the movie from all the frames in the temp_images folder and adds the credits to the end of the movie. The credits can be modified as desired using the included .psd file.

02d_rename.php : Renames the movie file to today's date and copies it to the archives folder.

03_archive.sh : Runs once a day. Copies all of the images into a "tarball" (.tar archive) that is renamed to today's date, and moves the tarball into the archives directory.

04a_empty_trash.sh : Runs once a day. Calls the 04b_empty_trash.scpt AppleScript. Cronnix seems to have occsionally issues running AppleScripts, so the 04a_empty_trash.sh script is only used to call the 04b_empty_trash.scpt AppleScript.

04b_empty_trash.scpt : Empties the trash (removes all the old temp images that were moved to the trash).

#################################	

Good Luck! If you have questions/comments, please drop me an email and I will try to get back to you.

- Jorma / scripts@jorma.com




 
