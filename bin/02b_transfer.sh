#! /bin/bash
#
##################### denali images ###############

###### remove corrupt images

rm /Users/jorma/dev/timelapse/camData/denali/images/depotimage*

/usr/local/bin/jpeginfo /Users/jorma/dev/timelapse/camData/denali/images/* -c -d

cd /Users/jorma/dev/timelapse/camData/denali/temp_images

rm -f *.jpg

cp /Users/jorma/dev/timelapse/camData/denali/images/*.jpg ./

### remove black (nighttime) images ###

rm -f denali_$(date +%Y_%m_%d)_00*
rm -f denali_$(date +%Y_%m_%d)_01*
rm -f denali_$(date +%Y_%m_%d)_02*
rm -f denali_$(date +%Y_%m_%d)_03*
rm -f denali_$(date +%Y_%m_%d)_04*
rm -f denali_$(date +%Y_%m_%d)_22*
rm -f denali_$(date +%Y_%m_%d)_23*
rm -f denali_$(date +%Y_%m_%d)_24*

################# Remove pix from previous day ###########
rm -f denali_$(date -r $(expr $(date +%s) - 86400) +%Y_%m_%d_)*

find . -size -20 -exec rm '{}' \;

############### Resize Images ##################

cd /Users/jorma/dev/timelapse/camData/denali/temp_images/

/usr/local/bin/mogrify -format jpg -resize 640x480 -quality 95 -background black -extent 640x480 -gravity center *.jpg

############### Remove old temp movie ##################

rm /Users/jorma/dev/timelapse/camData/denali/temp_movie/*.mp4