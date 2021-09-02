NUMBER="$1"
tar -x -z -f NthPrime.tgz
cd NthPrime
gcc main.c nth_prime.c -o NthPrime
./NthPrime $NUMBER
