To update the documentation in the `gh-pages` branch, you can do the following:

- checkout the `master` branch and make the `doc` folder
 
      git checkout master  git status
      make doc

- stash the changes in the `doc` 

      git add doc/*
      git stash

- checkout gh-pages and apply the stash    

      git checkout gh-pages 
      git checkout stash -- doc
      git commit -m "Update documentation"
      git push origin gh-pages



