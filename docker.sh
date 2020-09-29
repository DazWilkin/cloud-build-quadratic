#!/usr/bin/env bash

docker run --rm --volume=${PWD}:/workspace --workdir=/workspace busybox ash -c 'echo "Quadratic: $(cat a)x²+$(cat b)x+$(cat c)s=0"'

docker run --rm --volume=${PWD}:/workspace --workdir=/workspace busybox ash -c 'echo "$(cat b) * $(cat b)" | bc -l > b2'
docker run --rm --volume=${PWD}:/workspace --workdir=/workspace busybox ash -c 'echo "4 * $(cat a) * $(cat c)" | bc -l > 4ac'
docker run --rm --volume=${PWD}:/workspace --workdir=/workspace busybox ash -c 'echo "$(cat b2) - $(cat 4ac)" | bc -l > b2-4ac'

docker run --rm --volume=${PWD}:/workspace --workdir=/workspace busybox ash -c 'rm b2 4ac'

docker run --rm --volume=${PWD}:/workspace --workdir=/workspace busybox ash -c 'echo "sqrt($(cat b2-4ac))" | bc -l > sqrt'

docker run --rm --volume=${PWD}:/workspace --workdir=/workspace busybox ash -c 'rm b2-4ac'

docker run --rm --volume=${PWD}:/workspace --workdir=/workspace busybox ash -c 'echo "-($(cat b))+$(cat sqrt)" | bc -l > add'
docker run --rm --volume=${PWD}:/workspace --workdir=/workspace busybox ash -c 'echo "-($(cat b))-$(cat sqrt)" | bc -l > sub'

docker run --rm --volume=${PWD}:/workspace --workdir=/workspace busybox ash -c 'rm sqrt'

docker run --rm --volume=${PWD}:/workspace --workdir=/workspace busybox ash -c 'echo "2 * $(cat a)" | bc -l > 2a'

docker run --rm --volume=${PWD}:/workspace --workdir=/workspace busybox ash -c 'echo "$(cat add)/$(cat 2a)" | bc -l > root1'
docker run --rm --volume=${PWD}:/workspace --workdir=/workspace busybox ash -c 'echo "$(cat sub)/$(cat 2a)" | bc -l > root2'

docker run --rm --volume=${PWD}:/workspace --workdir=/workspace busybox ash -c 'rm 2a add sub'

# Complete
docker run --rm --volume=${PWD}:/workspace --workdir=/workspace busybox ash -c 'echo "Roots are: $(cat root1); $(cat root2)"'

docker run --rm --volume=${PWD}:/workspace --workdir=/workspace busybox ash -c 'rm root1 root2'