# How to fork and rebase - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/guides/github/how-to-fork-rebase
- Final URL: https://docs.pi-hole.net/guides/github/how-to-fork-rebase/
- Canonical URL: https://docs.pi-hole.net/guides/github/how-to-fork-rebase/
- Fetched at: 2026-06-23T13:42:26Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
How to fork and rebase
Forking and Cloning from GitHub to GitHub ¶
Fork https://github.com/pi-hole/pi-hole/ to a repo under a namespace you control, or have permission to use, for example: https://github.com/<your_namespace>/<your_repo_name>/ . You can do this from the github.com website.
Clone https://github.com/<your_namespace>/<your_repo_name>/ with the tool of you choice.
To keep your fork in sync with our repo , add an upstream remote for pi-hole/pi-hole to your repo .
git remote add upstream https://github.com/pi-hole/pi-hole.git
Checkout the development branch from your fork https://github.com/<your_namespace>/<your_repo_name>/ .
Create a topic/branch, based on the development branch code. Bonus fun to keep to the theme of Star Trek/black holes/gravity.
Make your changes and commit to your topic branch in your repo .
Rebase your commits and squash any insignificant commits. See the notes below for an example.
Merge development your branch and fix any conflicts.
Open a Pull Request to merge your topic branch into our repo 's development branch.
Keep in mind the technical requirements from above.
Forking and Cloning from GitHub to other code hosting sites ¶
Forking is a GitHub concept and cannot be done from GitHub to other git-based code hosting sites. However, those sites may be able to mirror a GitHub repo .
To contribute from another code hosting site, you must first complete the steps above to fork our repo to a GitHub namespace you have permission to use, for example: https://github.com/<your_namespace>/<your_repo_name>/ .
Create a repo in your code hosting site, for example: https://gitlab.com/<your_namespace>/<your_repo_name>/
Follow the instructions from your code hosting site to create a mirror between https://github.com/<your_namespace>/<your_repo_name>/ and https://gitlab.com/<your_namespace>/<your_repo_name>/ .
When you are ready to create a Pull Request (PR), follow the steps (starting at step #6) from Forking and Cloning from GitHub to GitHub and create the PR from https://github.com/<your_namespace>/<your_repo_name>/ .
Notes for squashing commits with rebase ¶
To rebase your commits and squash previous commits, you can use:
git rebase -i your_topic_branch~ ( number of commits to combine )
For more details visit gitready.com
The following would combine the last four commits in the branch mytopic .
git rebase -i mytopic~4
An editor window opens with the most recent commits indicated: (edit the commands to the left of the commit ID )
pick 9dff55b2 existing commit comments
squash ebb1a730 existing commit comments
squash 07cc5b50 existing commit comments
reword 9dff55b2 existing commit comments
Save and close the editor. The next editor window opens: (edit the new commit message). If you select reword for a commit, an additional editor window will open for you to edit the comment.
new commit comments
Signed-off-by: yourname <your email address>
Save and close the editor for the rebase process to execute. The terminal output should say something like the following:
Successfully rebased and updated refs/heads/mytopic.
Once you have a successful rebase, and before you sync your local clone, you have to force push origin to update your repo :
git push -f origin
Continue on from step #7 from Forking and Cloning from GitHub to GitHub
March 4, 2025
Back to top
