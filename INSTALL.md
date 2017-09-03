## OCaml compilation of the `fix-engine` model 

Build all the `*.cma` libraries in each module subfolder:

```
make build
```

Build a FIX server, based on the model:

```
make server
```

Build a FIX client that runs the test suite:

```
make build_test
```

To run the test suite, you can launch the `run_tests.sh` bash script.

## Making and updating documentation in the `gh-pages`

To update the documentation in the `gh-pages` branch, you can do the following:

- checkout the `master` branch and call maketo generate the `doc` folder
 
 ```
 git checkout master  git status
 make doc
 ```

- stash the changes in the `doc` folder

```
git add doc/*
git stash
```

- checkout gh-pages and apply the stash    

```
git checkout gh-pages 
git checkout stash -- doc
git commit -m "Update documentation"
git push origin gh-pages
```
