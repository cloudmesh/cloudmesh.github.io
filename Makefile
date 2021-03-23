.PHONY: manual

draft:
	hugo server -D

manual:
	cd manual; make

view:
	gopen http://localhost:1313/ 
server:
	hugo server

publish:
	hugo
	cp -r ../get docs
	git commit -m "Publish hugo" .
	git push

publish-get:
	cp -r ../get docs
	rm -r docs/get/.git
	git commit -m "Publish get" .
	git push

test:
#	pandoc a.md -t markdown-citations -s --bibliography a.bib --csl ieee.csl -o output.md
#	pandoc a.md --filter pandoc-citeproc -s --bibliography a.bib --csl ieee.csl -o output.md
	cat a.md | pandoc -t commonmark  -s --bibliography a.bib --csl ieee.csl
#-o output.md

list:
	python bin/tree.py > content/en/modules/list/_index.md
