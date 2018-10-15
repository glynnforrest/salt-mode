(require 'salt-mode)

(ert-deftest salt-test-auto-mode-alist ()
  (should (equal "\\.sls\\'" (car (rassoc 'salt-mode auto-mode-alist)))))

(ert-deftest salt-test-module-at-point ()
  (salt-test--with-buffer
   "
state_one:
  file.managed:
    - name: /some/file.txt

state_two:
  cmd.run:
    - name: whoami
    # some comment
    - runas: root
"
   ;; move down the file and assert the module at point for each line
   (mapc
    (lambda (expected)
      (should (equal expected (salt-mode--state-module-at-point)))
      (forward-line))
    '(nil
      nil
      "file.managed"
      "file.managed"
      nil
      nil
      "cmd.run"
      "cmd.run"
      nil
      "cmd.run"
      nil))))

(ert-deftest salt-test-font-lock-state-file ()
  (salt-test--with-buffer
   "
remove_vim:
  file.managed:
    - name: ~/.emacs.d/init.el
    - source: salt://init.el
    - require:
      - pkg: install_emacs
"
   (forward-line)
   (should (equal 'salt-mode-state-id-face (salt-test--face-at-point)))

   (re-search-forward "file.")
   (should (equal 'salt-mode-state-function-face (salt-test--face-at-point)))

   (re-search-forward "name:")
   (backward-char 2)
   (should (equal 'salt-mode-state-keyword-face (salt-test--face-at-point)))

   (re-search-forward "source:")
   (backward-char 2)
   (should (equal 'font-lock-variable-name-face (salt-test--face-at-point)))

   (re-search-forward "salt:")
   (backward-char 2)
   (should (equal 'salt-mode-file-source-face (salt-test--face-at-point)))

   (re-search-forward "require:")
   (backward-char 2)
   (should (equal 'salt-mode-requisite-face (salt-test--face-at-point)))))

(ert-deftest salt-test-font-lock-orch-file ()
  (salt-test--with-buffer
   "
deploy:
  salt.state:
    - tgt: 'os:Debian'
    - tgt_type: 'grain'
    - sls: project.state
    - pillar:
        foo: True
        bar: False
"
   (forward-line)
   (should (equal 'salt-mode-state-id-face (salt-test--face-at-point)))

   (re-search-forward "tgt:")
   (backward-char 2)
   (should (equal 'salt-mode-orch-keyword-face (salt-test--face-at-point)))

   (re-search-forward "tgt_type:")
   (backward-char 2)
   (should (equal 'salt-mode-orch-keyword-face (salt-test--face-at-point)))

   (re-search-forward "sls:")
   (backward-char 2)
   (should (equal 'salt-mode-orch-keyword-face (salt-test--face-at-point)))

   (re-search-forward "pillar:")
   (backward-char 2)
   (should (equal 'font-lock-variable-name-face (salt-test--face-at-point)))

   (re-search-forward "foo:")
   (backward-char 2)
   (should (equal 'font-lock-variable-name-face (salt-test--face-at-point)))))
