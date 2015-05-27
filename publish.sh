#!/bin/bash

set -e

_die() {
  local msg=$1
  echo $msg
  fail
}

cd ./public
git status | grep -c 'On branch gh-pages' >/dev/null || _die 'Unexpected git branch!'
git pull
git add .
git commit -m "Update document site by publish.sh"
git push origin gh-pages
