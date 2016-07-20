#!/bin/sh

pushd .

sandbox_dir = ${HOME}/git-sandbox

mkdir -p $sandbox_dir/remote
mkdir -p $sandbox_dir/clientA

cd $sandbox_dir/remote
git init --bare

cd $sandbox_dir/clientA
git init
touch README
git add README
git commit -m 'Initial commit'
git remote add origin $sandbox_dir/remote
git push -u origin master

cd $sandbox_dir
git clone $sandbox_dir/remote clientB
