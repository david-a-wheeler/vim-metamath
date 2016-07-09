# Contributing to vim-metamath

## Issues and proposals

If you have suggestions specific to this vim mode for metamath, please file an
[issue](https://github.com/david-a-wheeler/vim-metamath/issues).
Even better, create a change and file a
[pull request](https://github.com/david-a-wheeler/vim-metamath/pulls)
(start off from the git "develop" branch).
If you want to report a security vulnerability in this package (really?),
[contact me directly and privately via email](http://www.dwheeler.com/contactme.html) and tell me that you have a vulnerability to report
(I'll reply with more details).

## Branches

We use git.

As of version 1.0.0,
the "master" branch contains released versions
(the tip is the currently-released version).
The "develop" branch contains "in-development" versions, its
tip is the latest development version.

So if you're making modifications, use "git checkout develop".

This is a simplified version of
[Vincent Driessen's "A successful Git branching model"](http://nvie.com/posts/a-successful-git-branching-model/).
Once the "develop" branch is ready for a new release, we run:

~~~~sh
git checkout master
git merge --no-ff develop
git tag -a # VERSION NUMBER HERE, e.g., 1.0.0
git push
git checkout develop
git merge --no-ff develop
git push
~~~~




## Contribution requirements

Please generally follow the
[Google Vimscript Style Guide](https://google.github.io/styleguide/vimscriptguide.xml).
For example, prefer single-quotes over double-quotes for string constants.
One exception: That style guide
recommends that you prefix regexes with "\m\C",
which doesn't really make sense in most of our situations.
The "\m" option enables "magic" mode, however, this is unnecessary
in most of our situations because as documented in vim help,
"Syntax patterns are always interpreted like the 'magic' option is set,
no matter what the actual value of 'magic' is.
The "\C" option enables case-matching, but the syntax file
begins with "syntax case match" which forces this matching anyway.

Before submitting changes, please run the automated test suite
by running "make check".
If you add major new functionality, please add to the automated tests
(as run by "make check") to check that the additions work as expected
(see "function-check.vim").
We use Travis for continuous integration testing on every commit
to the central repository.

If you have general issues with vim or metamath, please contact those
projects instead.
