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
