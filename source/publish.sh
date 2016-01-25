#!/bin/bash

if [ $# -ne 1 ]; then
	echo "df error"
    exit 1;
fi

sculpin generate --env=prod

git stash
git checkout gh-page-production

cp -R output_prod/* .
rm -rf output_*

git add *
git commit -m "$1"
git push origin --all

git checkout master
git stash pop