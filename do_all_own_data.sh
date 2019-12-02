#!/bin/sh

trainCollection=$1
valCollection=$2
testCollection=$3
img_feature=$4
n_caption=$5

max_epochs=1
vocab_size=5
overwrite=1
vocab_name="word_vocab_${vocab_size}.txt"

echo $vocab_name

# Generate a dictionary on the training set
./do_gene_vocab.sh $trainCollection $vocab_size


# training
python2 w2vv_trainer.py $trainCollection $valCollection $testCollection \
    --overwrite $overwrite --img_feature $img_feature --n_caption $n_caption \
    --max_epochs $max_epochs --bow_vocab $vocab_name --rnn_vocab $vocab_name 


# evaluation (Notice that a script file do_test_${testCollection}.sh will be automatically generated when the training process ends.)
./do_test_${testCollection}.sh
