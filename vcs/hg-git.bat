@echo off

IF [%1] == [] GOTO PrintUsage
IF [%2] == [] GOTO PrintUsage

mkdir "%~2"
cd "%~2"
git init --bare .git
cd "%~1"
hg bookmark -r default master
hg push "%~2"
cd "%~2"
git config --bool core.bare false
git checkout master

GOTO Done

:PrintUsage
echo "usage: hg-git [hg-repo-path] [git-repo-path]"

:Done