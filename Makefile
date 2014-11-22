# Makefile is used to to ensure correct source paths


# You can always run tests from timekeeper root directory by "./tests/tests.sh" command
tests: tests/tests.sh nothing
	bash ./tests/tests.sh;

# Is there so tests are allways rebuildable
nothing:
	clear;

static_analysis:
	shellcheck --shell=bash `find . -iname "*.sh" | grep -iv "tests/include/" | grep -iv "\.git"`

# Installs with correct paths
install:
	echo "set-environment -g \"TTK_PLUGIN_DIR\"  \"`pwd`\"" >> ${HOME}/.tmux.conf;
	echo "source \"`pwd`/timekeeper.tmux\"" >> ${HOME}/.tmux.conf;
