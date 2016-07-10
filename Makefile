VIMDIR=$(HOME)/.vim/
VIMDIR_WINDOWS=$(HOMEPATH)\vimfiles
CP=cp
CP_OPTIONS=-pr

DESTDIR=

install:
	mkdir -p "$(VIMDIR)"
	$(CP) $(CP_OPTIONS) vim/* "$(DESTDIR)$(VIMDIR)"

# This installs in the *Windows* area when running on Cygwin.
install_windows:
	$(MAKE) VIMDIR=$(VIMDIR_WINDOWS)

uninstall:
	rm -f "$(DESTDIR)$(VIMDIR)"/ftdetect/metamath.vim 
	rm -f "$(DESTDIR)$(VIMDIR)"/syntax/metamath.vim 

# Install symbolic links to the files instead.
install_symlinks:
	mkdir -p "$(DESTDIR)$(VIMDIR)/ftdetect"
	mkdir -p "$(DESTDIR)$(VIMDIR)/syntax"
	ln -s "$(PWD)"/vim/ftdetect/metamath.vim \
	      "$(DESTDIR)$(VIMDIR)"/ftdetect/metamath.vim 
	ln -s "$(PWD)"/vim/syntax/metamath.vim \
	      "$(DESTDIR)$(VIMDIR)"/syntax/metamath.vim 

check:
	./runtest

test: check

# Make final release
release:
	git checkout master
	git merge --no-ff develop
	echo 'Please enter the new version number (e.g., 1.2.3)'
	git tag -a `read vers ; echo "$${vers}"`
	echo 'Version tag set to:'
	git tag --points-at HEAD
	git push
	git checkout develop
	git merge --no-ff master
	git push
