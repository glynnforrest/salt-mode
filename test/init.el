;; A minimal init file to get salt-mode working for testing.

(defvar salt-mode-root-dir (file-name-directory (directory-file-name (file-name-directory (or (buffer-file-name) load-file-name)))))

(require 'cask "~/.cask/cask.el")
(cask-initialize salt-mode-root-dir)

;; salt-mode should set yaml indentation without changing it globally
;; The default is 2 - the value of salt-mode-indent-level.
;; Opening test/simple.sls with this config should have a buffer local
;; indent offset of 2, but regular yaml files should still be 4.
(require 'yaml-mode)
(setq yaml-indent-offset 4)

(require 'salt-mode (concat salt-mode-root-dir "salt-mode.el"))
