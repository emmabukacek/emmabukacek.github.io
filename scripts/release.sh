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
  git status -s | awk '{print $2}' | xargs rm
  exit 1
}

npm run build
git checkout release || exit 1

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
