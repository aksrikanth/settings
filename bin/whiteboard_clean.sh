#!/bin/bash
# Needs ImageMagick.
# original GIMP algorithm: matthew.mceachen.us/blog/how-to-clean-up-photos-of-whiteboards-with-gimp-403.html
# imagemagick solution: https://gist.github.com/lelandbatey/8677901
# original command: convert "$1" -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 "$2"
convert "$1" -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 +dither -posterize 3 "$2"
