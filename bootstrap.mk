#!/usr/bin/make -f
## boostrap.mk (for stumpwm)
## Mac Radigan

.PHONY: bootstrap update packages-apt install ql-load ql-install
.DEFAULT_GOAL := bootstrap

bootstrap:
	curl -O http://beta.quicklisp.org/quicklisp.lisp
	sbcl --load quicklisp.lisp --eval '(quicklisp-quickstart:install) (ql:add-to-init-file) (ql:quickload "clx") (ql:quickload "cl-ppcre") (ql:quickload "alexandria") (sb-ext:quit)'
	autoreconf --force --install

install: bootstrap
	./configure --with-lisp=sbcl --prefix=/usr/local && make && sudo make install

ql-install:
	enhance sbcl --load quicklisp.lisp --eval "(quicklisp-quickstart:install)"

ql-load:
	enhance sbcl --load ~/quicklisp/setup.lisp

packages-apt:
	sudo apt-get install -y sbcl

## *EOF*
