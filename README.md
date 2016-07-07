# vim-metamath

This is vim-metamath, a vim mode to help edit
[metamath](http://metamath.org/) files.
Metamath is a tiny language that can express theorems in abstract mathematics,
accompanied by proofs that can be rigorously verified by a computer program.
This mode provides immediate feedback while you're editing using the
widely-used vim text editors.
This mode should help you detect and fix defects before you even save your file.
It is Free / libre / open source software, released under the MIT license.

This mode has the same goals, but is otherwise unrelated
and much more ambitious, than
[marnix/metamath.vim mode](https://github.com/marnix/metamath.vim).
It handles much more, e,g., it specially highlights different kinds of comments.

## Downloading and Installing


To download, make sure you have git installed. Then run at terminal window:

~~~~sh
git clone https://github.com/david-a-wheeler/vim-metamath.git
cd vim-metamath
~~~~

If you're running Unix/Linux (including MacOS) and have "make",
just run "make install" to install it
(this is a standard convention for installing files).
Running "make install" doesn't do any serious magic;
it just copies the files in the vim/ directory
into your local vim files directory.
On Unix/Linux systems (including MacOS) the local vim files directory
is "${HOME}/.vim", while on Windows it is "%userprofile%\vimfiles".
Running make will create your local vim files directory
and any necessary subdirectories if they don't already exist.

If you can't run make, feel free to directly create the necessary directories
and copy the files directly.

For example, on Windows, you can copy those files directly by running:

~~~~cmd
mkdir "%userprofile%\vimfiles"
mkdir "%userprofile%\vimfiles\ftdetect" "%userprofile%\vimfiles\syntax"
copy  "vim\ftdetect\\*.*" "%userprofile%\vimfiles\ftdetect"
copy  "vim\syntax\\*.*" "%userprofile%\vimfiles\syntax"
~~~~


Advanced users can use make and add parameters to it.
Just set VIMDIR to the vim files directory to install to, and/or
CP\_OPTIONS to set additional options to "cp" when copying.
The Makefile respects the DESTDIR convention, and it also
supports "make uninstall".  Here's an example:

> make VIMDIR="${HOME}/.vim-alt".

## Screenshots

Here are a few screenshots.
Note that vim-metamath and vim are extremely configurable, so you
can make your display look very different if you want it to.
By default this mode uses a range of different colors to
maximize feedback (which can help you avoid defects).

Here's an example of text-based vim (with :set background=dark):

![Vim metamath screenshot](https://github.com/david-a-wheeler/vim-metamath/blob/master/vim-metamath-screenshot.png)

Here's an example of GUI-based gvim (with :setcolor elflord):

![GVim metamath screenshot](https://github.com/david-a-wheeler/vim-metamath/blob/master/gvim-metamath-elflord.png)

## Issues and proposals

If you have suggestions specific to this vim mode for metamath, please file an
[issue](https://github.com/david-a-wheeler/vim-metamath/issues).
Even better, create a change and file a
[pull request](https://github.com/david-a-wheeler/vim-metamath/pulls).
If you want to report a security vulnerability in this package (really?),
[contact me directly and privately](http://www.dwheeler.com/contactme.html).

If you have general vim or metamath issues, please contact those
projects instead.
