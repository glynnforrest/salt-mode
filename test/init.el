;; A minimal init file to get salt-mode working for testing.

(require 'cask "~/.cask/cask.el")
(require 'f)

(let ((project-dir (f-parent (f-dirname (f-this-file)))))
  (cask-initialize project-dir)
  (add-to-list 'load-path project-dir))

;; salt-mode should set yaml indentation without changing it globally
;; The default is 2 - the value of salt-mode-indent-level.
;; Opening test/simple.sls with this config should have a buffer local
;; indent offset of 2, but regular yaml files should still be 4.
(require 'yaml-mode)
(setq yaml-indent-offset 4)

;; for convenience and to try out different salt-mode features
(eldoc-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq auto-save-default nil
      create-lockfiles nil
      make-backup-files nil)

(require 'salt-mode)
