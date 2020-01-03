#!/bin/sh
set -e

BRANCHES=$(git branch --sort=-committerdate)

I=1
BRANCH_NAMES=()
while IFS= read -r LINE; do
    BRANCH_NAMES[$I]=$LINE
    echo "$I. $LINE"
    I=$((I+1))
    if [ $I -gt 9 ]; then break; fi
done <<< "$BRANCHES"

echo "Pick a branch: "
read BRANCH_CHOICE

# Remove any leading spaces and *
BRANCH_NAME=$(echo "${BRANCH_NAMES[$BRANCH_CHOICE]}" | sed "s/[[:space:]]*[*]*[[:space:]]*//")

git checkout "$BRANCH_NAME"
