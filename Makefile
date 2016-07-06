
VIMDIR=$(HOME)/.vim/
CP=cp
CP_OPTIONS=-pr

DESTDIR=

install:
	mkdir -p "$(VIMDIR)"
	$(CP) $(CP_OPTIONS) vim/* "$(DESTDIR)$(VIMDIR)"

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
