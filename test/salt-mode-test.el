(require 'salt-mode)

(ert-deftest salt-test-auto-mode-alist ()
    (should (equal "\\.sls\\'" (car (rassoc 'salt-mode auto-mode-alist)))))
