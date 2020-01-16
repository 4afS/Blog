HUGOCMD=hugo
GITCMD=git
RMCMD=/bin/rm

build:
	@$(HUGOCMD) -v

watch:
	@$(HUGOCMD) server -D --watch

publish:
	@make build
	$(GITCMD) add .
	@$(GITCMD) commit -m "published at `date "+%Y/%m/%d %H:%M"`"
	$(GITCMD) push -u origin master

%.md:
	@$(HUGOCMD) new posts/$@

update:
	@$(GITCMD) pull --recurse-submodules
