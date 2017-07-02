build:
	cask install

dev:
	emacs -Q -l test/init.el

clean:
	rm -r .cask/

lint:
	emacs --batch -Q -l test/init.el -f package-lint-batch-and-exit salt-mode.el

.PHONY: build dev clean lint
