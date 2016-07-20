#!/bin/sh

exitOnFail() {
  if [ $? -ne 0 ] ; then
    exit 1
  fi 
}

mkdirOrFail() {
  directoryToCreate=$1

  mkdir -p $directoryToCreate

  exitOnFail
}

cdOrFail() {
  directoryToChangeTo=$1

  cd $directoryToChangeTo

  exitOnFail
}

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
sandbox_dir=$SCRIPT_DIR/git-sandbox

mkdirOrFail $sandbox_dir/remote
mkdirOrFail $sandbox_dir/clientA

cdOrFail $sandbox_dir/remote
git init --bare

cdOrFail $sandbox_dir/clientA
git init
touch README
git add README
git commit -m 'Initial commit'
git remote add origin $sandbox_dir/remote
git push -u origin master

cd $sandbox_dir
git clone $sandbox_dir/remote clientB

echo =============================================
echo  Sandbox created at $sandbox_dir
echo  Your remote origin repository is located at: $sandbox_dir/remote
echo  Two mock clients were created:
echo      $sandbox_dir/clientA 
echo      $sandbox_dir/clientB
echo
echo  Go ahead and experiment with pushing/pulling/rebasing/branching/merging
echo  using the mock clientA and clientB clones
echo =============================================
