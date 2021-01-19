SUBDIR=ex
INIT=./init.sh
ANS=./answers.sh
CHK=./check.sh
TMP=.tmp

SHELL=sh
FILES := 01-something-to-add/
FILES += 02-learning-to-commit/
FILES += 03-changing-the-past/
FILES += 04-branching-out/

ZIPS := $(patsubst %,$(SUBDIR)/%,$(FILES))
CHECKS := $(patsubst %,%/c,$(FILES))

.PHONY: all test clean zip

all: $(FILES)

check: $(CHECKS)

clean:
	rm -rf $(FILES)

zip:   all
	@echo
	@echo == Zipping ==
	@rm -f $(SUBDIR)
	@ln -s . $(SUBDIR)
	zip -9r git-in-git $(ZIPS) --exclude $(SUBDIR)/$(SUBDIR)
	@rm -f $(SUBDIR)

%/:
	mkdir $@
	$(SHELL) $(INIT) $@

%/c: %/
	$(SHELL) -c "$(ANS) $< > $(TMP)"
	$(SHELL) -c "cd $<; $(SHELL) ../$(TMP)"
	$(SHELL) -c "$(CHK) $<"
	rm $(TMP)
