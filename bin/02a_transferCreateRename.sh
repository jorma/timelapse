#! /bin/bash
#

sh /Users/jorma/dev/timelapse/bin/02b_transfer.sh

# Call create movie script

/usr/bin/osascript /Users/jorma/dev/timelapse/bin/02c_create_movie.scpt

### Rename movie

/usr/bin/php /Users/jorma/dev/timelapse/bin/02d_rename.php
