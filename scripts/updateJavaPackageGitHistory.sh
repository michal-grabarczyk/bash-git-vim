#!/bin/bash
# Rename in git history all old java package names (old.oldpackage) with new ones (new.newpackage).

git filter-branch --tree-filter " \
	find . -type f -name '*.java' -exec sed -i -e 's/old.oldpackage/new.newpackage/g' {} \; && \
	find . -type d -name oldpackage -execdir mv {} newpackage \; -prune && \
	find . -type d -name old -execdir mv {} new \; -prune \
	" \
	--msg-filter "sed -e 's/old.oldpackage/new.newpackage/g'"

# -execdir will execute the command in each subdirectory
# -prune causes find to not descend into the current file
