#!/bin/bash

# fail on non-0 exit codes, which makes it more obvious if a test has failed
set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $SCRIPT_DIR

for D in *; do
    # ignore the test's "target" directory
    if [ -d "${D}" ] && [ "${D}" != "target" ]; then
        echo "Testing $D"
        ${D}/test.sh
        # output separator
        echo ""
    fi
done
