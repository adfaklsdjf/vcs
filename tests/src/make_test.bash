#!/bin/bash

# This file can be used to generate a test script
# The actual tests are contained in tests.txt

testsfile=$(dirname "$0")/tests.txt

TESTNAME=$1
shift
REQS=$@

echo '#!/bin/bash'

for req in $REQS; do
	echo "source $req"
done

echo "source src/unittest.bash"

echo 'while read line ; do'
echo '	unittest $line'
echo 'done <<< "$(sed "/^[[:space:]]*#/d" "'$testsfile'" | grep "^'${TESTNAME}' ")"'



