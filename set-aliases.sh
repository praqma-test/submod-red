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

# Show the status of the super repository and all submodules.
git config alias.statusall "!f() { git status && \
    git submodule foreach git status; \
  }; f"

# Commit in submodules and the super repository.
# Arguments: The commit arguments, for example: -m 'commit message'
git config alias.commitall "!f() { \
    git submodule foreach git commit $@
    git commit $@
  }; f"
