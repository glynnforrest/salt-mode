# Salt Mode

[![License GPL 3][badge-license]][copying]

Salt Mode lets you edit [Salt][] states with [GNU Emacs][] 24.

Salt Mode is a major mode for [GNU Emacs][] 24 which adds support for
[Salt][] state syntax. Salt is a different approach to infrastructure management, 
founded on the idea that high-speed communication with large numbers of systems 
can open up new capabilities by [SaltStack][]. On top of this communication system,
 Salt provides an extremely fast, flexible, and easy-to-use configuration management 
system called Salt States.

This mode has only been tested in GNU Emacs 24. It may **not** work with GNU Emacs 23 and below,
or with other flavors of Emacs (e.g. XEmacs).

This uses [mmm-mode][] and [mmm-jinja2][] to hook up Jinja2 templates into YAML (essentially what SaltStack files are).

## Features

* Syntax highlighting
* Indentation and alignment of expressions and statements
* Jinja Templating Support
* Spell checking of comments with flyspell

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

## Support

Feel free to ask questions or make suggestions in the [issue tracker][] on [github][].

This package was originally authored by Ben Hayden; the current maintainer is Glynn Forrest.

## Development

`test/init.el` defines a minimal emacs configuration with the local salt-mode file loaded.

Run `make dev` to load it in a new emacs.

## Contributors

- [Ben Hayden](https://github.com/deybhayden)
- [Glynn Forrest](https://github.com/glynnforrest)
- [Joe Wreschnig](https://github.com/joewreschnig)

## License

Salt Mode is free software: you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

Salt Mode is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

See [`COPYING`][copying] for the complete license.

[badge-license]: https://img.shields.io/badge/license-GPL_3-green.svg
[COPYING]: https://github.com/glynnforrest/salt-mode/blob/master/COPYING
[Salt]: http://docs.saltstack.com/en/latest/
[SaltStack]: http://http://saltstack.com/
[GNU Emacs]: https://www.gnu.org/software/emacs/
[MELPA]: http://melpa.milkbox.net/
[MELPA Stable]: http://melpa-stable.milkbox.net/
[Issue tracker]: https://github.com/glynnforrest/salt-mode/issues
[Github]: https://github.com/glynnforrest/salt-mode
[mmm-mode]: https://github.com/purcell/mmm-mode
[mmm-jinja2]: https://github.com/glynnforrest/mmm-jinja2
