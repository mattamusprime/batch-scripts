@echo off

IF [%1] == [] GOTO PrintUsage
IF [%2] == [] GOTO PrintUsage

echo Making dir for git repo...
mkdir "%~2"

echo Saving paths
set START_ABS_PATH=%CD%
set HG_ABS_PATH=
set GIT_ABS_PATH=

pushd "%~1"
set HG_ABS_PATH=%CD%
popd
pushd "%~2"
set GIT_ABS_PATH=%CD%
popd

echo HG path - %HG_ABS_PATH%
echo GIT path - %GIT_ABS_PATH%

echo Making git repo...
mkdir %GIT_ABS_PATH%
cd %GIT_ABS_PATH%
git init --bare .git

echo Preparing hg repo
cd %HG_ABS_PATH%
hg bookmark -r default master

echo Pushing hg repo to git repo
hg push %GIT_ABS_PATH%
cd %GIT_ABS_PATH%

git config --bool core.bare false
git checkout master

GOTO Done

:PrintUsage
echo "usage: hg-git [hg-repo-path] [git-repo-path]"

:Done
cd %START_ABS_PATH%