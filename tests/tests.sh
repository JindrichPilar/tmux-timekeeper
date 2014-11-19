#!/usr/bin/env bash

# Source testing libraries
source "tests/include/assert.sh/assert.sh"
source "tests/include/stub.sh/stub.sh"

# Source all scripts
files=`find "scripts/" -iname "*.sh"`
for f in $files; do
	source "$f";
done

source stats/stats.sh

source tests/parserTests.sh
source tests/runTests.sh
source tests/saveTests.sh
source tests/fileLogTests.sh
source tests/statsTests.sh
