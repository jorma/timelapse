#! /bin/bash
#
##### Create new directory for images, move images to that dir, tar that and remove images from 'images' dir ######

################ denali ###########

cd /Users/jorma/dev/timelapse/camData/denali/images/

mkdir /Users/jorma/dev/timelapse/camData/denali/archives/images/denali_pix_$(date +%Y_%m_%d)

cp * /Users/jorma/dev/timelapse/camData/denali/archives/images/denali_pix_$(date +%Y_%m_%d)

rm *

cd /Users/jorma/dev/timelapse/camData/denali/archives/images/

tar czf denali_pix_$(date +%Y_%m_%d).tar.gz denali_pix_$(date +%Y_%m_%d)

rm -r denali_pix_$(date +%Y_%m_%d)
