(let ((project-dir (f-parent (f-dirname (f-this-file)))))
  (add-to-list 'load-path project-dir))
(require 'salt-mode)

(defmacro salt-test--with-buffer (contents &rest body)
  "Run lisp forms BODY in a salt-mode buffer containing CONTENTS."
  `(with-temp-buffer
     (salt-mode)
     (insert ,contents)
     (goto-char (point-min))
     ,@body))
