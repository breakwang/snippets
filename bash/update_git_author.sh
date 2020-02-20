#!/bin/bash
# Version:0.1
# File Name: update_git_author.sh
# Author: xianbao.wang
# email: breakwang0929@gmail.com
# Created Time: 一 11/18 10:56:06 2019
# For more information,
# see https://help.github.com/en/github/using-git/changing-author-info#

git filter-branch --env-filter '

OLD_EMAIL="your-old-email@example.com"
CORRECT_NAME="Your Correct Name"
CORRECT_EMAIL="your-correct-email@example.com"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
