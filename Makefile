DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CONFDIR    := $(wildcard .config/*)
CANDIDATES := $(wildcard .??*) $(wildcard .config/*/*)
EXCLUSIONS := .DS_Store .git .gitmodules .config
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

.DEFAULT_GOAL := help

list: ## Show list of dot files
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

update: ## Update this repository
	git pull origin main

install: ## Create symlink to home directory
	@echo '==> Create symlink to home directory...'
	@echo ''
	@$(foreach val, $(CONFDIR), mkdir -p $(HOME)/$(val);)
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

clean: ## Remove dot files in home directory
	@echo '==> Remove dot files in home directory...'
	@echo ''
	@$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
