#!/bin/bash

# Store argument into the variable  "NUMBER"
NUMBER="$1"

# Decompress and Untar the NthPrime file
tar -x -z -f NthPrime.tgz

# Change directory to the newly extracted directory
# or exit program if that fails.
cd NthPrime || exit

# Compile "main.c" and "nth_prime.c" to an executable program
gcc main.c nth_prime.c -o NthPrime

# Run the NthPrime program
./NthPrime "$NUMBER"
