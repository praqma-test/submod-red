#!/bin/bash
## Set Git aliases (local to this repository)

git config alias.pullall "!f() { git pull && \
    git submodule update --init --recursive && \
    git submodule foreach git pull origin master; \
  }; f"
