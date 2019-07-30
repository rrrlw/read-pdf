#!/bin/bash

#############################################
# Convert pdf documents to txt format       #
# by Raoul R. Wadhwa, Marvin Natowicz       #
# Created on 30 July 2019.                  #
# Code on https://github.com/rrrlw/read-pdf #
#############################################

# check if input pdf file exists
if !(test -f $1); then
	echo "Input file does not exist."
	exit 1
fi

# check if output file already exists (don't want to overwrite)
if test -f $3; then
	echo "Output file already exists; rename or delete to avoid being overwritten."
	exit 1
fi

# check `temp` directory exists (if so, discontinue)
TEMP_FOLDER=./test
if test -e TEMP_FOLDER; then
	echo "temp directory already exists, please rename or remove."
	exit 1
else
	mkdir "temp"
fi

# for each page i in the pdf:
for ((i=1;i<=$2;i++))
do
	# extract page i from pdf w/ qpdf
	qpdf --pages $1 $i -- $1 "temp/pdf-$i .pdf"
	
	# convert page i pdf-->tif format w/ ImageMagick
	convert -density 300 "temp/pdf-$i .pdf" -depth 8 "temp/tif-$i .tif"
	
	# convert page i tif-->txt format w/ Tesseract OCR (save in temp folder)
	tesseract "temp/tif-$i .tif" "temp/txt-$i"
	
	# delete tif of page i
	rm "temp/pdf-$i .pdf"
	
	# delete pdf of page i
	rm "temp/tif-$i .tif"	
done

# create output file
touch $3
	
# for all files in temp directory:
FILES=temp/*
for f in $FILES
do
	# append all file content to initially empty output txt document
	cat $f >> $3
	
	# delete txt documents as you go
	rm $f
done

# delete temp directory
rmdir temp


