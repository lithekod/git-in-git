INIT=init.sh
ANS=answers.sh
CHK=check.sh
TMP=.tmp

SHELL=sh
FILES := 01-something-to-add/
FILES += 02-learning-to-commit/
FILES += 03-changing-the-past/
FILES += 04-branching-out/

CHECKS := $(patsubst %,%/c,$(FILES))

.PHONY: all test clean

all: $(FILES)

check: $(CHECKS)

clean:
	rm -rf $(FILES)

%/:
	mkdir $@
	$(SHELL) $(INIT) $@

%/c: %/
	$(SHELL) -c "$(ANS) $< > $(TMP)"
	$(SHELL) -c "cd $<; $(SHELL) ../$(TMP)"
	$(SHELL) -c "$(CHK) $<"


# .PHONY: all solve test clean
# 
# all:   $(OUTFOLDERS)
# solve: $(ANSWERS)
# test:  $(CHECKS)
# zip:   all
# 	@echo
# 	@echo == Zipping ==
# 	@rm -f $(SUBDIR)
# 	@ln -s . $(SUBDIR)
# 	zip -9r git-in-git $(ZIPS) --exclude $(SUBDIR)/$(SUBDIR)
# 	@rm -f $(SUBDIR)
# 
# clean:
# 	rm -rf $(OUTFOLDERS)
# 
# %: %/$(INIT)
# 
# %/$(OUT)/$(ANS): %/$(OUT)
# 	cd $<; bash ../$(ANS)
# 
# %/$(OUT)/$(CHK): %/$(OUT) %/$(OUT)/$(ANS)
# 	cd $<; bash ../$(CHK)
# 
# %/$(OUT): % clean
# 	@echo
# 	@echo == $< ==
# 	@cd $<; mkdir -p $(OUT); cd $(OUT); cp -r ../*.txt .; bash ../$(INIT)
# 
