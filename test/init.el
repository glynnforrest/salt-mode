;; A minimal init file to get salt-mode working for testing.

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")))

(defvar salt-mode-root-dir (file-name-directory (directory-file-name (file-name-directory (or (buffer-file-name) load-file-name)))))
(setq package-user-dir (concat salt-mode-root-dir "pkgs/"))

(package-initialize)
(package-refresh-contents)

(dolist (pkg '(yaml-mode mmm-jinja2))
    (unless (package-installed-p pkg)
  (package-install pkg)))

(require 'salt-mode (concat salt-mode-root-dir "salt-mode.el"))
