#!/usr/bin/env bash

# Source testing libraries
source "tests/include/assert.sh/assert.sh"
source "tests/include/stub.sh/stub.sh"

# Source all scripts
files=`find "scripts/" -iname "*.sh"`
for f in $files; do
	source "$f";
done


assert_end examples
