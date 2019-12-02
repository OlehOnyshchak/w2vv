#!/bin/sh

trainCollection=$1
valCollection=$2
testCollection=$3

overwrite=0
max_epochs=1
vocab_size=5
vocab_name="word_vocab_${vocab_size}.txt"

# Generate a dictionary on the training set
./do_gene_vocab.sh $trainCollection $vocab_size


# training
python2 w2vv_trainer.py $trainCollection $valCollection $testCollection \
    --overwrite $overwrite --max_epochs $max_epochs \
    --bow_vocab $vocab_name --rnn_vocab $vocab_name


# evaluation (Notice that a script file do_test_${testCollection}.sh will be automatically generated when the training process ends.)
./do_test_${testCollection}.sh
