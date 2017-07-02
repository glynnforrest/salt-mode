build:
	cask install

dev:
	emacs -Q -l test/init.el

clean:
	rm -r .cask/

lint:
	emacs --batch -Q -l test/init.el -f package-lint-batch-and-exit salt-mode.el

test:
	cask exec ert-runner --reporter ert+duration

.PHONY: build dev clean lint test
