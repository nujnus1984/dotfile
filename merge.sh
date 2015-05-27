#!/bin/sh
git stash
git merge origin master
git stash pop
