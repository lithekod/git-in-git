OUT=out/
INIT=init.sh
ANS=ans.sh
CHK=chk.sh
SUBDIR=ex
SLIDES=slides.pdf

EXRS=$(wildcard */$(INIT))
OUTFOLDERS=$(patsubst %/$(INIT),%/$(OUT),$(EXRS))
ANSWERS=$(patsubst %,%/$(ANS),$(OUTFOLDERS))
CHECKS=$(patsubst %,%/$(CHK),$(OUTFOLDERS))
ZIPS=$(patsubst %/out/,$(SUBDIR)/%/,$(OUTFOLDERS)) $(SLIDES)

.PHONY: all solve test clean $(SLIDES)

all:   $(OUTFOLDERS) $(SLIDES)

$(SLIDES): presentation/main.pdf
	make -C presentation handout.pdf
	cp presentation/handout.pdf $(SLIDES)

solve: $(ANSWERS)
test:  $(CHECKS)
zip:   all
	@echo
	@echo == Zipping ==
	@rm -f $(SUBDIR)
	@ln -s . $(SUBDIR)
	zip -9r git-in-git $(ZIPS) --exclude $(SUBDIR)/$(SUBDIR)
	@rm -f $(SUBDIR)

clean:
	rm -rf $(OUTFOLDERS)
	rm -f $(SLIDES)

%: %/$(INIT)

%/$(OUT)/$(ANS): %/$(OUT)
	cd $<; bash ../$(ANS)

%/$(OUT)/$(CHK): %/$(OUT) %/$(OUT)/$(ANS)
	cd $<; bash ../$(CHK)

%/$(OUT): % clean
	@echo
	@echo == $< ==
	@cd $<; mkdir -p $(OUT); cd $(OUT); cp -r ../*.txt .; bash ../$(INIT)

