## Jekyll site generation

To generate the site locally, run `./serve` in the root directory of this repo. The site will then appear at `http://127.0.0.1:4000/fix-engine/`.

## Re-generate odoc Ocaml documentation

Do this once:

```
~/fix-engine $ git worktree add ../fix-engine-doc gh-pages-src
~/fix-engine $ cd ../fix-engine-doc
~/fix-engine-doc $ git submodule update --init
```

Generate the docs:

```
~/fix-engine $ make doc
```

Copy them to the `gh-pages-src` branch:

```
~/fix-engine $ cd ../fix-engine-doc
~/fix-engine-doc $ git rm -r _pages/doc
~/fix-engine-doc $ cp -r ../fix-engine/_build/default/_doc/_html _pages/doc
```

Resurrect the customized `odoc` CSS:

```
~/fix-engine-doc $ git reset HEAD -- _pages/doc/odoc.css _pages/doc/img
~/fix-engine-doc $ git checkout -- _pages/doc/odoc.css _pages/doc/img
```

Edit `~/fix-engine-doc/_pages/doc/index.html` and add an empty `<nav>` tag at the top of the `<body>`. This will add the docs logo:

```html
...
  <body>
    <nav></nav>
    ...
```

Add the new docs and commit:
```
~/fix-engine-doc $ git add _pages/doc
~/fix-engine-doc $ git commit -m "Update odoc-generated Ocaml docs"
```

Test your changes:
```
~/fix-engine-doc $ ./serve
```

Push:
```
~/fix-engine-doc $ git push origin gh-pages-src
```
