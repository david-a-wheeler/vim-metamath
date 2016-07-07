# vim-metamath

This is vim-metamath, a vim mode for editing [metamath](http://metamath.org/)
files by David A. Wheeler.  It provides immediate feedback, which
should help you detect and fix defects before you even save your file.

This mode has the same goals, but is otherwise unrelated
and much more ambitious, than
[marnix/metamath.vim mode](https://github.com/marnix/metamath.vim).
It handles much more, e,g., it specially highlights different kinds of comments.

## Installation

Just copy the files in vim/ to your local vim files directory.
On Unix/Linux systems that is "${HOME}/.vim", while on
Windows it is "%userprofile%\vimfiles".
If you're running Unix/Linux and have "make", running "make install"
will install the program.

## Screenshots

Here are a few screenshots.
Note that vim-metamath and vim are extremely configurable, so you
can make your display look very different if you want it to.
By default this mode uses a range of different colors to
maximize feedback (which can help you avoid defects).

Here's an example of text-based vim (withi :set background=dark):

![Vim metamath screenshot](https://github.com/david-a-wheeler/vim-metamath/blob/master/vim-metamath-screenshot.png)

Here's an example of GUI-based gvim (withi :setcolor elflord):

![GVim metamath screenshot](https://github.com/david-a-wheeler/vim-metamath/blob/master/gvim-metamath-elflord.png)
