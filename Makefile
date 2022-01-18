# Makefile
.PHONY: setup install test lint

setup: 
	echo "Executing make setup"
	# Install Hadolint
	[ -f /bin/hadolint ] && echo "Hadolint already exists!!" || \
	    ( sudo wget -q -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.8.0/hadolint-Linux-x86_64 && \
	      sudo chmod +x /bin/hadolint  && echo "Hadolint installed!" ) 
	# Create python virtualenv & source it
	[ -f ~/.devops/bin/activate ] && echo "Python venv '.devops' already exists!!" || \
	    ( python3 -m venv ~/.devops && \
	      . ~/.devops/bin/activate  && echo "Python venv '.devops' setup!" ) 
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
	# This is linter for Dockerfiles
	hadolint Dockerfile
	#
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	. ~/.devops/bin/activate
	pylint --disable=R,C,W1203,W1202 src/app.py

all: setup install lint