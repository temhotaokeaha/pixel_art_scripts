#!/bin/sh
for i; do
    size=($(identify -format "%w %h" "$i"));
    (( size[0] != 16 || size[1] != 16 )) && rm -v "$i"; # if not equal 16 then remove
done;
