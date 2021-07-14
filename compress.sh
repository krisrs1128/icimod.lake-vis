#!/bin/bash
# A short script for extracting first three channels from the geotiffs  and
# compressing them.

for f in $(ls *.tif); do
  echo $f
  gdal_translate -b 1 -b 2 -b 3 $f small-$f
  tar -zcvf $f.tar.gz small-$f
  rm small-$f
done
