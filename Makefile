PATHNAME=$(shell pwd)
BASENAME=$(shell basename $(PATHNAME))

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
# SPHINX DOC
###############################################################################

html: sphinx

sphinx:
	cd doc; $(MAKE) html
	cp -r doc/build/html/* .
	cp -r doc/source/images .

view:
	open index.html


