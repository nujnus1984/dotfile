#!/bin/sh
git fetch origin master:tmp
git diff tmp
