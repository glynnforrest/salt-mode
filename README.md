# Salt-mode

[![License GPL 3][badge-license]][copying]
[![Build Status][badge-travis]][travis]
[![MELPA Badge][badge-melpa]][melpa]
[![MELPA Stable Badge][badge-melpa-stable]][melpa-stable]

Salt-mode is a [GNU Emacs][] major mode for editing [SaltStack][] state files.

[Salt] is a Python-based configuration management and orchestration
system built on top of a high-speed remote execution engine.
Configuration management is most commonly managed by writing state files ending with `.sls`;
this mode adds emacs support for these files.

Salt-mode requires a minimum emacs version of 24.4.

This uses [mmm-mode][] and [mmm-jinja2][] to hook up Jinja2 templates into YAML (essentially what SaltStack files are).

## Features

* Syntax highlighting
* Indentation and alignment of expressions and statements
* Jinja Templating Support
* Spell checking of comments with flyspell
* Open documentation for state functions
* Navigation by state function

## Installation

From [MELPA][] or [MELPA Stable][] with <kbd>M-x package-install RET
salt-mode</kbd>.

## Usage

Just visit Salt state files. The major mode is enabled automatically for Salt
states with the extension `.sls`.

### Flyspell

To enable flyspell for comments when using the mode:

```elisp
(add-hook 'salt-mode-hook
        (lambda ()
            (flyspell-mode 1)))
```

### State documentation

Use `salt-mode-browse-doc` to browse the documentation of the state module at point.

When run with a prefix argument, prompt for the state module to use.

If you have Python and the Salt Python modules installed, documentation may be viewed within Emacs via `C-c C-d` (`salt-mode-describe-state`) or ElDoc.

### Function jumping

Use `salt-mode-forward-state-function` and `salt-mode-backward-state-function`, bound by default to <kbd>C-M-b</kbd> and <kbd>C-M-f</kbd>, to navigate by salt function.

## Support

Feel free to ask questions or make suggestions in the [issue tracker][] on [github][].

This package was originally authored by Ben Hayden; the current maintainer is Glynn Forrest.

## Development

`test/init.el` defines a minimal emacs configuration with the local salt-mode file loaded.

Run `make dev` to load it in a new emacs.

You can also use the .sls files in `test/` to test various mode functions.

## Contributors

- [Ben Hayden](https://github.com/deybhayden)
- [Glynn Forrest](https://github.com/glynnforrest)
- [Joe Wreschnig](https://github.com/joewreschnig)

## License

Salt-mode is free software: you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

Salt-mode is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

See [`COPYING`][copying] for the complete license.

[badge-license]: https://img.shields.io/badge/license-GPL_3-green.svg
[COPYING]: https://github.com/glynnforrest/salt-mode/blob/master/COPYING
[badge-travis]: https://travis-ci.org/glynnforrest/salt-mode.svg?branch=master
[travis]: https://travis-ci.org/glynnforrest/salt-mode
[badge-melpa]: https://melpa.org/packages/salt-mode-badge.svg
[melpa]: https://melpa.org/#/salt-mode
[badge-melpa-stable]: https://stable.melpa.org/packages/salt-mode-badge.svg
[melpa-stable]: https://stable.melpa.org/#/salt-mode

[Salt]: http://docs.saltstack.com/en/latest/
[SaltStack]: http://http://saltstack.com/
[GNU Emacs]: https://www.gnu.org/software/emacs/
[MELPA]: http://melpa.milkbox.net/
[MELPA Stable]: http://melpa-stable.milkbox.net/
[Issue tracker]: https://github.com/glynnforrest/salt-mode/issues
[Github]: https://github.com/glynnforrest/salt-mode
[mmm-mode]: https://github.com/purcell/mmm-mode
[mmm-jinja2]: https://github.com/glynnforrest/mmm-jinja2
