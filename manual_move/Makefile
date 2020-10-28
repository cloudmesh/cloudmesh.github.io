package=manual
UNAME=$(shell uname)
VERSION=`head -1 VERSION`

.PHONY: watch

GIT=https://github.com/cloudmesh
COMMUNITY=$(GIT)-community

HERCULES=docker run --rm srcd/hercules hercules
LABOURS=docker run --rm -i -v $(pwd):/io srcd/hercules labours
SOURCE=docs-source/source
API=docs-source/source/api
REGISTER=docs-source/source/register

ifeq ($(UNAME),Linux)
    OPEN=gopen
else
    OPEN=open
endif

define banner
	@echo
	@echo "###################################"
	@echo $(1)
	@echo "###################################"
endef


all:
	pip install sphinx_rtd_theme
	cms debug off
	cms debug off
	make -f Makefile manual
	cms timer on
	cms debug on

watch:
	find docs-source/ | entr -s 'make; make view'

install:
	pip install cloudmesh-installer -U
	cd ..; cloudmesh-installer new manual

# $(call banner, "use: make manual")

dest/gitinspector/gitinspector.py:
	mkdir -p dest
	cd dest; git clone https://github.com/ejwa/gitinspector.git

inspect-book:
	python dest/gitinspector/gitinspector.py \
	   $(COMMUNITY)/book \
	   --grading=True \
	   --metrics=False \
	   --hard=True \
		--format=htmlembedded > $(SOURCE)/inspector/book.html
	cp -r $(SOURCE)/inspector docs/inspector

MODULES= \
cloudmesh-inventory \
cloudmesh-cmd5 \
cloudmesh-sys \
cloudmesh-common \
cloudmesh-cloud \
cloudmesh-storage \
cloudmesh-volume \
cloudmesh-abstract \
cloudmesh-configuration \
cloudmesh-google \
cloudmesh-aws \
cloudmesh-azure \
cloudmesh-oracle \
cloudmesh-multipass \
cloudmesh-gui \
cloudmesh-cmsd \
cloudmesh-installer \
cloudmesh-openapi \
cloudmesh-sys \
cloudmesh-test \
cloudmesh-javascript


api:
	rm -rf docs-source/source/api
	rm -rf tmp
	mkdir -p tmp/cloudmesh
	sphinx-apidoc -f -o docs-source/source/api tmp/cloudmesh
	make -f Makefile api-index

# NOT INCLUDED

#../cloudmesh-analytics:
#../cloudmesh-audio:
#../cloudmesh-batch:
#../cloudmesh-box:
#../cloudmesh-cluster:
#../cloudmesh-comet:
#../cloudmesh-docker:
#../cloudmesh-emr:
#../cloudmesh-encrypt:
#../cloudmesh-flow:
#../cloudmesh-flow2:
#../cloudmesh-frugal:
#../cloudmesh-git:
#../cloudmesh-hadoop:
#../cloudmesh-iu:
#../cloudmesh-kubernetes:
#../cloudmesh-launcher:
#./cloudmesh-libcloud:
#../cloudmesh-manual:
#../cloudmesh-nist:
#../cloudmesh-nn:
#../cloudmesh-notebooks:
#../cloudmesh-pi-burn:
#../cloudmesh-pi-cluster:
#../cloudmesh-pi-cluster-Host:
#../cloudmesh-redshift:
#../cloudmesh-secchi:
#../cloudmesh-spark:
#../cloudmesh-storagelifecycle:
#../cloudmesh-sys:
#../cloudmesh-test:
#../cloudmesh-twitter:
#../cloudmesh-workflow:


api-index:
	echo "Cloudmesh Command API" > $(API)/index.rst
	echo "===============================" >> $(API)/index.rst
	echo "" >> $(API)/index.rst
	echo ".. toctree::" >> $(API)/index.rst
	echo "   :maxdepth: 1" >> $(API)/index.rst
	echo "" >> $(API)/index.rst

	cd $(API); ls -1 *.command.rst \
	| sed 's/^/   /' \
	| sed 's/.rst//' \
	| sort -u >> index.rst

	echo "" >> $(API)/index.rst
	echo "Cloudmesh API" >> $(API)/index.rst
	echo "===============================" >> $(API)/index.rst
	echo "" >> $(API)/index.rst
	echo ".. toctree::" >> $(API)/index.rst
	echo "   :maxdepth: 1" >> $(API)/index.rst
	echo "" >> $(API)/index.rst


	cd $(API); ls -1 *.rst \
	| fgrep -v command.rst | fgrep -v index.rst | fgrep -v modules.rst \
	| sed 's/^/   /' \
	| sed 's/.rst//' \
	| sort -u >> index.rst

inspect: dest/gitinspector/gitinspector.py
	for c in $(MODULES) ; do \
		python dest/gitinspector/gitinspector.py \
			$(GIT)/$$c \
	   	   	--grading=True \
	   		--metrics=False \
	   		--hard=True \
	   		--format=htmlembedded > $(SOURCE)/inspector/$$c.html; \
	done
	cp -r $(SOURCE)/inspector docs/inspector

contrib:
	git config --global mailmap.file .mailmap
	@bin/authors.py

register:
	mkdir -p $(REGISTER)
	cms register list sample --service=compute --kind=openstack > $(REGISTER)/compute-openstack.rst
	cms register list sample --service=compute --kind=aws > $(REGISTER)/compute-aws.rst
	cms register list sample --service=compute --kind=azure > $(REGISTER)/compute-azure.rst
	cms register list sample --service=compute --kind=google > $(REGISTER)/compute-google.rst
	cms register list sample --service=compute --kind=oracle > $(REGISTER)/compute-oracle.rst
	cms register list sample --service=compute --kind=multipass > $(REGISTER)/compute-multipass.rst
	#
	cms register list sample --service=volume --kind=openstack > $(REGISTER)/volume-openstack.rst
	cms register list sample --service=volume --kind=aws > $(REGISTER)/volume-aws.rst
	cms register list sample --service=volume --kind=azure > $(REGISTER)/volume-azure.rst
	cms register list sample --service=volume --kind=google > $(REGISTER)/volume-google.rst
	cms register list sample --service=volume --kind=oracle > $(REGISTER)/volume-oracle.rst
	cms register list sample --service=volume --kind=multipass > $(REGISTER)/volume-multipass.rst
	#
	cms register list sample --service=storage --kind=openstack > $(REGISTER)/storage-openstack.rst
	cms register list sample --service=storage --kind=awss3 > $(REGISTER)/storage-awss3.rst
	cms register list sample --service=storage --kind=azureblob > $(REGISTER)/storage-azureblob.rst
	cms register list sample --service=storage --kind=box > $(REGISTER)/storage-box.rst
	cms register list sample --service=storage --kind=local > $(REGISTER)/storage-local.rst
	cms register list sample --service=storage --kind=parallel > $(REGISTER)/storage-parallel.rst
	cms register list sample --service=storage --kind=parallelazureblob > $(REGISTER)/storage-parallelazureblob.rst
	cms register list sample --service=storage --kind=parallelgdrive > $(REGISTER)/storage-parallelgdrive.rst
	cms register list sample --service=storage --kind=oracle > $(REGISTER)/storage-oracle.rst


source:
	cd ../cloudmesh.common; make source
	$(call banner, "Install cloudmesh-cmd5")
	pip install -e . -U
	cms help

manual-new:
	mkdir -p $(SOURCE)/manual/flow
	cms man --kind=rst flow > $(SOURCE)/manual/flow/flow.rst
	mkdir -p $(SOURCE)/manual/openapi
	cms man --kind=rst openapi > $(SOURCE)/manual/openapi/openapi.rst

manual:
	cms set timer=False
	mkdir -p $(SOURCE)/manual
	cms help > /tmp/commands.rst
	-echo "Command List" > $(SOURCE)/manual/all.rst
	-echo "============" >> $(SOURCE)/manual/all.rst
	-echo >> $(SOURCE)/manual/all.rst
	-echo "Not all commands  be listed here as cloudmesh can have plugins.\n" >> $(SOURCE)/manual/all.rst
	-echo  >> $(SOURCE)/manual/all.rst
	-echo  "::" >> $(SOURCE)/manual/all.rst
	-echo  >> $(SOURCE)/manual/all.rst
	-tail -n +5 /tmp/commands.rst | sed 's/^/  /' >> $(SOURCE)/manual/all.rst
	-echo  >> $(SOURCE)/manual/all.rst
	-echo  "" >> $(SOURCE)/manual/all.rst
	cms man --dir=$(SOURCE)/manual --format=rst
	cms version --number > $(SOURCE)/manual/versions.txt
	make -f Makefile doc

authors:
	git config --global mailmap.file .mailmap
	@bin/authors.py > $(SOURCE)/preface/authors.rst

doc: authors
	mv ~/.cloudmesh/cloudmesh.yaml ~/.cloudmesh/cloudmesh.yaml-tmp
	wget -P ~/.cloudmesh https://raw.githubusercontent.com/cloudmesh/cloudmesh-config/main/cloudmesh/configuration/etc/cloudmesh.yaml
	rm -rf docs
	mkdir -p dest
	@make -f Makefile api
	cd docs-source; make html
	cp -r $(SOURCE)/_ext docs-source/build/html
	cp -r $(SOURCE)/_templates docs-source/build/html
	cp -r docs-source/build/html/ docs
	mv ~/.cloudmesh/cloudmesh.yaml-tmp ~/.cloudmesh/cloudmesh.yaml
	cp -r $(SOURCE)/inspector docs/inspector
	touch docs/.nojekyll

pdf: authors
	mv ~/.cloudmesh/cloudmesh.yaml ~/.cloudmesh/cloudmesh.yaml-tmp
	wget -P ~/.cloudmesh https://raw.githubusercontent.com/cloudmesh/configuration/etc/cloudmesh.yaml
	rm -rf docs
	mkdir -p dest
	cd docs-source; make latex
	cd docs-source/build/latex; make
	mv ~/.cloudmesh/cloudmesh.yaml-tmp ~/.cloudmesh/cloudmesh.yaml

view:
	$(OPEN) docs/index.html


clean:
	$(call banner, "CLEAN")
	rm -rf dist
	rm -rf *.zip
	rm -rf *.egg-info
	rm -rf *.eggs
	rm -rf docs-source/build
	rm -rf build
	rm -rf .tox
	rm -f *.whl
	rm -rf docs
	rm -rf tmp
	find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf
	rm -fr docs/_build/



######################################################################
# PYPI
######################################################################


twine:
	pip install -U twine

dist:
	python setup.py sdist bdist_wheel
	twine check dist/*

patch: clean
	$(call banner, "bbuild")
	bump2version --no-tag --allow-dirty patch
	python setup.py sdist bdist_wheel
	git push
	# git push origin main --tags
	twine check dist/*
	twine upload --repository testpypi  dist/*
	# $(call banner, "install")
	# sleep 10
	# pip install --index-url https://test.pypi.org/simple/ cloudmesh-$(package) -U
	make
	git commit -m "update ocumentation" docs
	git push

minor: clean
	$(call banner, "minor")
	bump2version minor --allow-dirty
	@cat VERSION
	@echo

release: clean
	$(call banner, "release")
	git tag "v$(VERSION)"
	git push origin main --tags
	python setup.py sdist bdist_wheel
	twine check dist/*
	twine upload --repository pypi dist/*
	$(call banner, "install")
	@cat VERSION
	@echo
	#sleep 10
	#pip install -U cloudmesh-common


dev:
	bump2version --new-version "$(VERSION)-dev0" part --allow-dirty
	bump2version patch --allow-dirty
	@cat VERSION
	@echo

reset:
	bump2version --new-version "4.0.0-dev0" part --allow-dirty

upload:
	twine check dist/*
	twine upload dist/*

pip:
	pip install --index-url https://test.pypi.org/simple/ cloudmesh-$(package) -U

#	    --extra-index-url https://test.pypi.org/simple

log:
	$(call banner, log)
	gitchangelog | fgrep -v ":dev:" | fgrep -v ":new:" > ChangeLog
	git commit -m "chg: dev: Update ChangeLog" ChangeLog
	git push
