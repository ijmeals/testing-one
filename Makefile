help:
	@printf "Available targets:\n\n"
	@awk '/^[a-zA-Z\-\_0-9%:\\]+/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = $$1; \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			gsub("\\\\", "", helpCommand); \
			gsub(":+$$", "", helpCommand); \
			printf "  \x1b[32;01m%-35s\x1b[0m %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST) | sort -u
	@printf "\n"

all:
	@echo "all"

## Builds the API
build:
	make nmri
	npm run build

## Removes the node modules dir and reinstalls models
nmri:
	rm -rf node_modules/*
	npm i

## Adds ESLint
install-eslint:
	npm install --save-dev eslint @typescript-eslint/parser @typescript-eslint/eslint-plugin
