SUBDIR=ex
INIT=./init.sh
ANS=./answers.sh
CHK=./check.sh
TMP=.tmp
SLIDES=slides.pdf

SHELL=sh
FILES := 01-something-to-add/
FILES += 02-learning-to-commit/
FILES += 03-changing-the-past/
FILES += 04-branching-out/

ZIPS := $(patsubst %,$(SUBDIR)/%,$(FILES))
CHECKS := $(patsubst %,%/c,$(FILES))

.PHONY: all solve test clean clean-local zip $(SLIDES)

all: $(FILES) $(SLIDES)
	make -C presentation all

$(SLIDES):
	make -C presentation handout.pdf
	cp presentation/handout.pdf $(SLIDES)

check: $(CHECKS)

clean-local:
	rm -rf $(FILES)
	rm -f git-in-git.zip

clean: clean-local
	make -C presentation clean

zip: all
	@echo
	@echo == Zipping ==
	@rm -f $(SUBDIR)
	@ln -s . $(SUBDIR)
	zip -9r git-in-git $(ZIPS) --exclude $(SUBDIR)/$(SUBDIR)
	@rm -f $(SUBDIR)

%/: clean-local
	mkdir $@
	$(SHELL) $(INIT) $@

%/c: %/
	$(SHELL) -c "$(ANS) $< > $(TMP)"
	$(SHELL) -c "cd $<; $(SHELL) ../$(TMP)"
	$(SHELL) -c "$(CHK) $<"
	rm $(TMP)
