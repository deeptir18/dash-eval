#!/bin/bash
DATAFILE=originals
mogrify  -format gif -path images/bash/thumbs -thumbnail 100x100 images/bash/${DATAFILE}/*.jpg
