#! /bin/bash
#

############## Download Images ################

cd /Users/jorma/dev/timelapse/camData/denali/images/

/usr/local/bin/wget http://www.nps.gov/webcams-dena/depotimage.jpg

mv depotimage.jpg denali_$(date -v +2H +%Y_%m_%d_%H%M).jpg


