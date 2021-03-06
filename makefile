# Usability Dynamics component build.
#
# @author potanin@UD
# @source https://gist.github.com/andypotanin/084f15057ba01a5cc385
# @version 0.0.1

test-all:	clean document test-code

install:
	upm-install

push:
	yuidoc -q --configfile static/yuidoc.json
	upm-install
	upm-build
	upm-commit

update:
	upm-udpate
	upm-build
	yuidoc -q --configfile static/yuidoc.json

document:
	yuidoc -q --configfile static/yuidoc.json

test-code:
	@NODE_ENV=test mocha \
  --timeout 200 \
  --ui exports \
  --reporter list \
  test/*.js

clean:
	rm -fr static/codex/lib-cov
