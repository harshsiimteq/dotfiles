#!/bin/bash

co() {
  git checkout "$1"
}

con() {
  git checkout -b "$1"
}

commit() {
  MESSAGE="$1"

  if [ "$MESSAGE" = "" ]; then
      MESSAGE="wip"
  fi
  git add .
  eval "git commit -a -m '${MESSAGE}'"
}

amend() {
  git add .
  git commit -a --amend
  git push -f
}

pullrebase() {
  git add .
  git stash
  git pull --rebase
  git stash pop
}

rebase() {
  git add .
  git stash
  git rebase -i "$1"
  git stash pop
  git add .
  git commit --amend
  git push -f
}

greset() {
  BRANCH=$(git branch --show-current)
  git reset --hard origin/"${BRANCH}"
}

clslara() {
  php artisan cache:clear
  php artisan view:clear
  php artisan config:clear
  php artisan route:clear
  php artisan debugbar:clear
  php artisan optimize:clear
}
