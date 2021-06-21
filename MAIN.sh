#!/bin/bash

fileName=$1

mkdir -p $fileName
lilypond -dpreview -e '(define cardify #t)' -o ./output $fileName.ly

# Generate Audio from MIDI
for i in output/*.midi; do timidity "$i" -Ow; done

python3 generateAnki.py $fileName
