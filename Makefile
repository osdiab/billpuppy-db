.PHONY: all install-deps test lint thrift

all: test lint

install-deps:
	@echo "======================="
	@echo "INSTALLING DEPENDENCIES"
	@echo "-----------------------"
	npm install
	@echo "\n"

test: install-deps
	@echo "============="
	@echo "RUNNING TESTS"
	@echo "-------------"
	./node_modules/mocha/bin/mocha --compilers ts:typescript-require
	echo "\n"

lint: install-deps
	@echo "============"
	@echo "RUNNING LINT"
	@echo "------------"
	@# Lint all typescript files that are not from libs, generated code, and typings
	tslint `find ./ \( -name node_modules -o -name "gen-*" -o -name typings \) -prune -o -name '*.ts' -print`
	@echo "\n"

thrift:
	thrift -gen js:ts -gen js:node ./billpuppy-db.thrift
	cp ./.BillpuppyDb.d.ts ./gen-nodejs/BillpuppyDb.d.ts
