
VIMDIR=$(HOME)/.vim/
CP=cp
CP_OPTIONS=-pr

install:
	mkdir -p "$(VIMDIR)"
	$(CP) $(CP_OPTIONS) vim/* "$(VIMDIR)"

# Install symbolic links to the files instead.
install_symlinks:
	mkdir -p "$(VIMDIR)"
	mkdir -p "$(VIMDIR)/ftdetect"
	mkdir -p "$(VIMDIR)/syntax"
	ln -s vim/ftdetect/metamath.vim "$(VIMDIR)"/ftdetect/metamath.vim 
	ln -s vim/syntax/metamath.vim "$(VIMDIR)"/syntax/metamath.vim 
