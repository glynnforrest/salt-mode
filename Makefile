dev:
	emacs -Q -l test/init.el

clean:
	rm -r pkgs/

.PHONY: dev clean
