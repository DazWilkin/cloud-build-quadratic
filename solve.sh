#!/usr/bin/env bash

echo "Quadratic: $(cat a)x²+$(cat b)x+$(cat c)s=0"

echo "$(cat b) * $(cat b)" | bc -l > b2
echo "4 * $(cat a) * $(cat c)" | bc -l > 4ac
echo "$(cat b2) - $(cat 4ac)" | bc -l > b2-4ac

rm b2 4ac

echo "sqrt($(cat b2-4ac))" | bc -l > sqrt

rm b2-4ac

echo "-($(cat b))+$(cat sqrt)" | bc -l > add
echo "-($(cat b))-$(cat sqrt)" | bc -l > sub

rm sqrt

echo "2 * $(cat a)" | bc -l > 2a

echo "$(cat add)/$(cat 2a)" | bc -l > root1
echo "$(cat sub)/$(cat 2a)" | bc -l > root2

rm 2a add sub

# Complete
echo "Roots are: $(cat root1); $(cat root2)"

rm root1 root2