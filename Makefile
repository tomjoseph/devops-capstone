# Makefile
.PHONY: setup install test lint clean

setup: 
	echo "Executing make setup"
	# Create python virtualenv & source it
	[ -f ~/.devops/bin/activate ] && echo "venv .devops already exists!!" || \
	    ( python3 -m venv ~/.devops && \
	      . ~/.devops/bin/activate  && echo "venv .devops setup!" ) 
	# Install Hadolint
	[ -f ~/.devops/bin/hadolint ] && echo "Hadolint already exists!!" || \
	    ( sudo wget -q -O ~/.devops/bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.8.0/hadolint-Linux-x86_64 && \
	      sudo chmod +x ~/.devops/bin/hadolint  && echo "Hadolint installed!" ) 
	#

install: 
	echo "Executing make install"
	# This should be run from inside a virtualenv
	. ~/.devops/bin/activate
	pip install --upgrade pip && \
		pip install -r requirements.txt

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	echo "Executing make lint"
	. ~/.devops/bin/activate
	# This is linter for Dockerfiles
	hadolint Dockerfile
	#
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1202 src/app.py

clean:
	rm -f ~/.devops

all: setup install lint