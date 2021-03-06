#!/bin/sh

trainCollection=$1

overwrite=0

# generate the word vocabulary of the training set
freq_threshold=$2

for text_style in bow bow_filterstop
do
    python2 get_word_vob.py $trainCollection $text_style $freq_threshold $overwrite
done

