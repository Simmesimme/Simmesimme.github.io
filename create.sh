#!/bin/bash

# This script can be used to create a redirection copy of your
# website! It copies a directory structure containing html files from
# $INPUT_DIR to $OUTPUT_DIR. For each html file in $INPUT_DIR, a copy
# of template.html.in is created in $OUTPUT_DIR. Then, all occurences
# of @FILE@ in the template are replaced with the name of the copied
# file.

# The output dir is assumed to be the location of this script.
OUTPUT_DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $OUTPUT_DIR

# The input dir must be passed as first parameter.
INPUT_DIR="$1"

find $INPUT_DIR -name "*.html" -printf "%P\n" | while read file; do
    mkdir -p $(dirname $file)
    cp template.html.in $file
    sed -i -e "s~@FILE@~$file~g" $file
done