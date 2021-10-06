[rebase](https://womanonrails.com/git-rebase-onto)       

git rebase --onto <newparent> <oldparent> <until>           
  change parents
  ```
  oldparent->next->parent = newparent
  ```
chery-pick       
  ```
  git cherry-pick A^..B
// If you want to ignore A itself, run:
git cherry-pick A..B
  ```
ours and theirs is a somewhat confusing concept; exacerbated when performing a rebase:

When performing a merge, ours refers to the branch you're merging into, and theirs refers to the branch you are merging from. So if you are trying to resolve conflicts in the middle of a merge:

use ours to accept changes from the branch we are currently on
use theirs to accept changes from the branch we are merging into.
That makes sense, right?

When rebasing, ours and theirs are inverted. Rebases pick files into a "detached" HEAD branch. The target is that HEAD branch, and merge-from is the original branch before rebase. That makes:

--ours the anonymous one the rebase is constructing, and
--theirs the one being rebased;
I.e., rebasing replays the current branch's commits (one at a time) on top of the branch that we intend to rebase with.
