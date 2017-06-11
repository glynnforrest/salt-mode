dev:
	emacs -Q -l test/init.el

clean:
	rm -r pkgs/

lint:
	emacs --batch -Q -l test/init.el -f package-lint-batch-and-exit salt-mode.el

.PHONY: dev clean lint
