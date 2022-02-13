#!/bin/sh
echo "This will stitch all 16x16 PNGs in a single atlas."
echo "Please enter the folder, default is [mods]:";
read desiredfolder;
desiredfolder="${desiredfolder:=mods}";

if [ -d $desiredfolder ]; then

    echo "Making a copy of $desiredfolder folder...";
    mkdir stitch_backup;
    rsync -a -v --ignore-existing $desiredfolder stitch_backup; # copy over the whole target folder

    if [ -d stitch_backup ]; then                               # check if folder was actually created
        cd stitch_backup;                                       # switch to it if so
        else
        echo "Unable to make backup. Aborting...";
        sleep 5;
        exit 1;
    fi;

    find . ! -name *.png -type f -delete;                       # remove everything except PNGs
    find . -iname "*.png" -type f | xargs -P 0 -L 1 ../ext.sh;  # remove PNGs other than 16x16. IDK how to avoid externalizing
    find -name \*.png > ../unsorted_list.txt;                   # make a list of remaining PNGs and their locations
    sort ../unsorted_list.txt > ../list.txt;                    # sort the list of PNGs
    rm ../unsorted_list.txt;                                    # remove unsorted list

    cnt=0;                                                      # variable declaration for a loop
    shopt -s globstar;                                          # enable something or whatever
    for i in ** ; do [ -f "$i" ] && mv -v "$i" "$cnt.png"; cnt=$((cnt=cnt+1)); done; # rename files numerically and move in one place
    for a in [0-9]*.png; do mv $a `printf %04d.%s ${a%.*} ${a##*.}`; done;           # add leading zeros
    for f in *.png ; do mv "$f" tile_"$f" ; done;               # add tile_ prefix
    gm convert +append *.png row.png;                           # stitch everything in a huge row
    rm tile_*.png;                                              # remove everything except row
    gm convert row.png -crop 512x16 +adjoin stripe_%04d.png;    # unstitch to stripes of 32 textures
    rm row.png;                                                 # remove row
    gm convert -append *.png ../atlas.png;                      # stitch stripes into an atlas
    cd ../;
    rm -r stitch_backup;
    exit 1;

else
    echo "No $desiredfolder folder was found!";
fi;
