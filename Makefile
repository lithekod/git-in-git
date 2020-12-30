OUT=out/
INIT=init.sh
ANS=ans.sh
CHK=chk.sh

EXRS=$(wildcard */$(INIT))
OUTFOLDERS=$(patsubst %/$(INIT),%/$(OUT),$(EXRS))
ANSWERS=$(patsubst %,%/$(ANS),$(OUTFOLDERS))
CHECKS=$(patsubst %,%/$(CHK),$(OUTFOLDERS))

.PHONY: all solve test clean

all:   $(OUTFOLDERS)
solve: $(ANSWERS)
test:  $(CHECKS)
zip:   all
	@echo
	@echo == Zipping ==
	zip -9 -r git-in-git */
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

