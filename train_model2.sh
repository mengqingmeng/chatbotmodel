#!/bin/bash

test_arg="false"
bleu_arg="-1"
if [ ! -z $1 ]
then
    if [ $1 == "test" ]
    then
        test_arg="true"
    fi
    if [ $1 == "bleu" ]
    then
        if [ ! -z $2 ]
        then
            bleu_arg="$2"
        fi
    fi
fi

python s2s.py \
--size 512 \
--num_layers 3 \
--num_epoch 20 \
--batch_size 64 \
--num_per_epoch 100000 \
--test $test_arg \
--bleu $bleu_arg \
--model_dir ./model/model2
