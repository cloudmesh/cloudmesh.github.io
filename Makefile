PATHNAME=$(shell pwd)
BASENAME=$(shell basename $(PATHNAME))

.PHONY: version1

TAG=`cat VERSION.txt`

all: html
	make -f Makefile view

######################################################################
# GIT INTERFACES
######################################################################
push:
	$(MAKE) -f Makefile clean
	git commit -a 
	git push

pull:
	git pull 

gregor:
	git config --global user.name "Gregor von Laszewski"
	git config --global user.email laszewski@gmail.com


######################################################################
# INSTALLATION
######################################################################
req:
	pip install -r requirements.txt

dist:
	$(MAKE) -f Makefile pip

sdist: clean
	#make -f Makefile clean
	python setup.py sdist --format=bztar,zip


force:
	$(MAKE) -f Makefile nova
	$(MAKE) -f Makefile pip
	pip install -U dist/*.tar.gz

install:
	pip install dist/*.tar.gz

######################################################################
# PYPI
######################################################################

upload:
	$(MAKE) -f Makefile pip
#	python setup.py register
	python setup.py sdist upload

pip-register:
	python setup.py register

# #####################################################################
# CLEAN
# #####################################################################


clean:
	rm -rf *.egg
	find . -name "*~" -exec rm {} \;  
	find . -name "*.pyc" -exec rm {} \;  
	rm -rf build doc/build dist *.egg-info *~ #*
	cd doc; $(MAKE) clean
	rm -rf *.egg-info

#############################################################################
# VERSION1 DOC - SPHINX 
###############################################################################

hugo:
	cd source/home; hugo
	touch docs/.nojekyll

html: version4

version4:
	mkdir -p docs/version4
	cd source/version4; $(MAKE) html
	cp -r source/version4/build/html/* docs
	cp -r source/version4/source/images docs

version1:
	mkdir -p docs/version1
	cd source/version1; $(MAKE) html
	cp -r source/version1/build/html/* docs/version1
	cp -r source/version1/source/images docs/version1

view:
	open docs/index.html

publish: version1
	git add *.html *.js images _images _static _sources
	git commit -am "update web page" 
	git push

