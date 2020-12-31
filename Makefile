OUT=out/
INIT=init.sh
ANS=ans.sh
CHK=chk.sh
SUB=ex

EXRS=$(wildcard */$(INIT))
OUTFOLDERS=$(patsubst %/$(INIT),%/$(OUT),$(EXRS))
ANSWERS=$(patsubst %,%/$(ANS),$(OUTFOLDERS))
CHECKS=$(patsubst %,%/$(CHK),$(OUTFOLDERS))
ZIPS=$(patsubst %/out/,$(SUB)/%/,$(OUTFOLDERS))

.PHONY: all solve test clean

all:   $(OUTFOLDERS)
solve: $(ANSWERS)
test:  $(CHECKS)
zip:   all
	@echo
	@echo == Zipping ==
	@rm -f $(SUB)
	@ln -s . $(SUB)
	zip -9r git-in-git $(ZIPS) --exclude $(SUB)/$(SUB)
	@rm -f $(SUB)

clean:
	rm -rf $(OUTFOLDERS)

%: %/$(INIT)

%/$(OUT)/$(ANS): %/$(OUT)
	cd $<; bash ../$(ANS)

%/$(OUT)/$(CHK): %/$(OUT) %/$(OUT)/$(ANS)
	cd $<; bash ../$(CHK)

%/$(OUT): % clean
	@echo
	@echo == $< ==
	@cd $<; mkdir -p $(OUT); cd $(OUT); cp -r ../*.txt .; bash ../$(INIT)

