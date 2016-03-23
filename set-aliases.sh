#!/bin/bash
## Set Git aliases (local to this repository)

# Pull all remote changes to the super repository
# and all submodules.
# Gotcha: 'git submodule update' will silently overwrite any local changes
# within a submodule.
git config alias.pullall "!f() { git pull && \
    git submodule update --init --recursive && \
    git submodule foreach git pull origin master; \
  }; f"
