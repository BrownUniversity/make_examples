# VARS
FILE1  = file.txt
FILE2  = config.conf
OPTION = "-v"
SUBS   = $(shell cat ${FILE1})

# don't track these as files
.PHONY: help setup ${SUBS} all clean

# Specify the default target
.DEFAULT_GOAL := help

# Targets
# Simple target, no prereqs
setup:                      # This is a target
	chmod 755 simple.sh       # This is a recipe

# Use contents of a var as multiple targets
${SUBS}:
	cd $@; pwd

# A var as a real file target
${FILE2}:
	cp ${FILE1} $@

# A target that uses other targets
all: config.conf setup ${SUBS}
	./simple.sh ${OPTION} ${FILE2}

# Some clean up - note the order
clean: 
	rm ${FILE2}
	chmod 644 simple.sh

# Echo a bunch of text for help. Optional 
help:
	@echo 'Makefile example'
	@echo 'Usage:'
	@echo '   make help                print help text'
	@echo '   make setup               just chmod shell file'
	@echo '   make config.conf         creates this file'
	@echo '   make all                 run them all'
	@echo '   make clean               clean up'
	@echo ''