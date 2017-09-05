#!/usr/bin/env bash
#
# ---
# RELEASE SCRIPT
# ---
#
# It's shitty and weird.
# (•_•)
# ( •_•)>⌐■-■
# (⌐■_■)

graceful_exit() {
  git reset HEAD .
  git checkout -- .
  git status -s | awk '$1 == "??" {print $2}' | xargs rm 2> /dev/null || printf "\n\nAll clear! Exiting...\n"
  exit 1
}

npm run build
git checkout develop || exit 1

mkdir __temp
cp dist/* __temp
cp -r fonts/ __temp
git checkout -- .

git checkout master
cp -rf __temp/* .
rm -rf __temp
git add .

git commit || graceful_exit

git push
