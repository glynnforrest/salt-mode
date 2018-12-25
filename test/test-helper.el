(let ((project-dir (f-parent (f-dirname (f-this-file)))))
  (add-to-list 'load-path project-dir))
(require 'salt-mode)

(defmacro salt-test--with-buffer (type contents &rest body)
  "Run lisp forms BODY in a salt-mode buffer containing CONTENTS."
  `(with-temp-buffer
     (salt-mode)
     (salt-mode-set-file-type ,type)
     (insert ,contents)
     (goto-char (point-min))
     (font-lock-fontify-buffer)
     ,@body))

(defun salt-test--face-at-point ()
  "Get the face at the current point."
  (get-char-property (point) 'face))
