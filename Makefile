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
clean:
	rm -rf $(OUTFOLDERS)

%: %/$(INIT)

%/$(OUT)/$(ANS): %/$(OUT)
	cd $<; bash ../$(ANS)

%/$(OUT)/$(CHK): %/$(OUT) %/$(OUT)/$(ANS)
	cd $<; bash ../$(CHK)

%/$(OUT): % clean
	@echo == $< ==
	@cd $<; mkdir -p $(OUT); cd $(OUT); cp -r ../*.txt .; bash ../$(INIT)

