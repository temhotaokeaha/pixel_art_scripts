#!/bin/sh
mkdir stitch_backup;                                       # create temporary folder
cd stitch_backup;                                          # go in that folder
gm convert ../atlas.png -crop 16x16 +adjoin tile_%03d.png; # unstitch in that folder
cd ../;                                                    # go back
for file in ./stitch_backup/*.png; do read line; mv -v "${file}" "${line}";  done < list.txt; # rename from list and put to where they were
rm list.txt;                                               # remove list
rm -r stitch_backup;                                       # remove temporary folder
