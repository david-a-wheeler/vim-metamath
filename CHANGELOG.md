# Change Log

This is the vim-metamath change Log.

All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

This change log generally follows the conventions from
[keepachangelog.com](http://keepachangelog.com/), which defines
a change log as a file
"which contains a curated, chronologically ordered list
of notable changes for each version of a project."
The point is to "make it easier for users and contributors
to see precisely what notable changes have been made between
each release (or version) of the project."

## [1.0.2] - 2016-07-09

- Modify display so that highlighting begins exactly where the
  construct is recognized.  Previous versions delayed highlighting,
  which looked nice, but it could be confusing when interacting with it.
  Now, when you start an axiom ($a), it immediately recognizes it
  and higlights it that way.
- Automate release process in the Makefile, to reduce risk of doing it
  incorrectly.

## [1.0.1] - 2016-07-09

- Display the [CII Best Practices badge](https://bestpractices.coreinfrastructure.org/projects/240).

## [1.0.0] - 2016-07-09

- Officially released version 1.0.0.
- Got a [CII Best Practices badge](https://bestpractices.coreinfrastructure.org/projects/240). To get the badge, I:
  - Added information on acceptable contributions to meet
    "contribution_requirements".
    I added those to CONTRIBUTE.md.  I added a reference to the
    Google style guide for vimscript, and modified the code to match.
  - Added unique version number to meet "version_unique" and began using
    semantic versioning.
  - Added a CHANGELOG.md file to meet "release_notes".
  - Note that I had already added an automated test suite and running
    Travis, which were also inspired by the badge list.

## Commit 736cb29e422a5f2 - 2016-07-09

- Fixed functional testing so it now works on Travis
  (for continuous integration).

## Commit cb648c2371df408 - 2016-07-07

- Added initial automated tests.  It checks syntax and some simple
  functional capabilities. Just run 'make check'.

## Commit 4cddd3367184c2e - 2016-07-06

- Add screenshots


## [0.0.0] - 2016-07-05

- Initial commit of vim-metamath, a vim mode for metamath

