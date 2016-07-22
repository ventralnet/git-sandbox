# Purpose

`create-git-sandbox.sh` is a simple BASH script that will create a local mock environment that a new user to GIT can use to experiment and learn. It creates a local bare repository that acts as a remote repository, and two client directories which mimic two separate developers that have the repository cloned.

The script will create three directories
 * `./remote`
 * `./clientA`
 * `./clientB`

`./remote` is a remote repository the student can 'push' and 'pull' from (don't worry about this folder. Just know that is where your remote repository (origin) is)

`./clientA` is a clone of the repository that mocks being a developer having the repository checked out

`./clientB` is a clone of the repository that mocks being another developer having the repository checked out


That is all there is to it.  Push, pull, commit, add, rebase in your own GIT sandbox.
