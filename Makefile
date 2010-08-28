DESTDIR = $(HOME)
FILES = zprofile zshenv zshrc
TARGETS = $(addprefix $(DESTDIR)/., $(FILES))

all: $(TARGETS)

$(TARGETS) : $(DESTDIR)/.% : %
	ln $< $(DESTDIR)/.$*

.PHONY: all
