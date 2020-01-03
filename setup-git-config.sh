#!/bin/sh

get_abs_filename() {
  # $1 : relative filename
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

bpPath=$(get_abs_filename "git-pick-branch.sh")

# Aliases
git config --global alias.a 'add -A'
git config --global alias.c commit
git config --global alias.cm 'commit -m'
git config --global alias.s status
git config --global alias.l log
git config --global alias.b 'branch --sort=-committerdate'
git config --global alias.amend 'commit --amend --no-edit'
git config --global alias.amendm 'commit --amend'
git config --global alias.p '!git push origin $(git rev-parse --abbrev-ref HEAD)'
git config --global alias.co checkout
git config --global alias.cob 'checkout -b'
git config --global alias.bp '!'"$bpPath"''
