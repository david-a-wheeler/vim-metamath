# vim-metamath

[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/240/badge)](https://bestpractices.coreinfrastructure.org/projects/240)
[![Build Status](https://travis-ci.org/david-a-wheeler/vim-metamath.svg?branch=master)](https://travis-ci.org/david-a-wheeler/vim-metamath)

This is vim-metamath, a vim mode to help edit
[metamath](http://metamath.org/) files.
Metamath is a tiny language that can express theorems in abstract mathematics,
accompanied by proofs that can be rigorously verified by a computer program.
Vim-metamath is a vim mode that provides immediate feedback
while you're editing metamath files using the widely-used vim text editors.
This mode should help you detect and fix defects before you even save your file.
It is Free / libre / open source software, released under the MIT license.

Unlike
[marnix/metamath.vim mode](https://github.com/marnix/metamath.vim),
this vim mode is *much* more ambitious and strives to differentiate
many different things.
For example, it specially highlights different kinds of comments
inside a comment area, and it colorizes certain operators differently.
This creates a lot of visual differentiation that makes it easier to
distinguish different kinds of information.

## Version

This is version 1.0.0.
This project adheres to [Semantic Versioning](http://semver.org/).

## Downloading

To download, make sure you have git installed. Then run in a terminal window:

~~~~sh
git clone https://github.com/david-a-wheeler/vim-metamath.git
cd vim-metamath
~~~~

This will get the current released version (in the "master" branch).
To get the development version, then do "git checkout develop".

## Installing

On Unix/Linux (including MacOS), run "make install"
to install it (this is a standard convention for installing files).
You're done!

On Windows, do the following:

~~~~cmd
mkdir "%userprofile%\vimfiles"
mkdir "%userprofile%\vimfiles\ftdetect" "%userprofile%\vimfiles\syntax"
copy  "vim\ftdetect\\*.*" "%userprofile%\vimfiles\ftdetect"
copy  "vim\syntax\\*.*" "%userprofile%\vimfiles\syntax"
~~~~

If you're an advanced user, read on.

Running "make install" doesn't do any serious magic;
it just copies the files and directories from this mode's "vim/" directory
to your local vim files directory "~/.vim"
(creating directories as needed).
If you can't run make, feel free to directly create the necessary directories
and copy the files directly.

Advanced users can run make with additional parameters that set
VIMDIR (the vim files directory to install to), and/or
CP\_OPTIONS (additional options for "cp" when copying).
The Makefile respects the DESTDIR convention
(a prefix to the installation directory that you can pass via
an environment variable or make parameter).
You can also run "make uninstall" to uninstall the files.
Here's an example:

> make VIMDIR="${HOME}/.vim-alt".

## Screenshots

Here are a few screenshots.
Note that vim-metamath and vim are extremely configurable, so you
can make your display look very different if you want it to.
By default this mode uses a range of different colors to
maximize feedback (which can help you avoid defects).

These screenshots show the set.mm file while it's being edited.
This is typically processed and turned into HTML pages for viewing.
For example, see the
[Metamath page for df-an (definition of "and")](http://us.metamath.org/mpegif/df-an.html).
[Theorem *4.64 of Whitehead and Russell](http://us.metamath.org/mpegif/pm4.64.html).
Detailed proofs are often created by other tools and turned into compressed
form shown here.

Here's an example of text-based vim (with :set background=dark):

![Vim metamath screenshot](https://github.com/david-a-wheeler/vim-metamath/blob/master/vim-metamath-screenshot.png)

Here's an example of GUI-based gvim (with :setcolor elflord):

![GVim metamath screenshot](https://github.com/david-a-wheeler/vim-metamath/blob/master/gvim-metamath-elflord.png)

## Suggestions and Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md)
for more information about how to provide suggestions,
report problems, submit improvements, or in any other way contribute.

This project adheres to [Semantic Versioning](http://semver.org/).

If you have general issues with vim or metamath, please contact those
projects instead.
