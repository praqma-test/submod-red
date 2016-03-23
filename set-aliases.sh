#!/bin/bash
## Set Git aliases (local to this repository).

# Pull all remote changes to the super repository
# and all submodules.
# Gotcha: 'git submodule update' will silently overwrite any local changes
# within a submodule.
git config alias.pullall "!f() { git pull && \
    git submodule update --init --recursive && \
    git submodule foreach git pull origin master; \
  }; f"

# Show the status of the super repository and all submodules.
git config alias.statusall "!f() { \
    git submodule foreach git status && \
    git status; \
  }; f"

# Stage all changes in submodules and in the super repository.
git config alias.addall "!f() { \
    git submodule foreach git add --all && \
    git add --all; \
  }; f"

# Commit in submodules and the super repository.
# Use 'git diff' to check that there are staged changes - otherwise 'git commit'
# exits with an error code.
git config alias.commitall "!f() { \
    git submodule foreach 'git diff --quiet --exit-code --cached || git commit' && \
    git commit; \
  }; f"

# Push in submodules, add the submodules, and push in the super repository.
git config alias.pushall "!f() { \
    git submodule foreach git push && \
    grep path .gitmodules | sed 's/.*= //' | xargs git add && \
    git commit -m 'Update submodules' && \
    git push; \
  }; f"
