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
