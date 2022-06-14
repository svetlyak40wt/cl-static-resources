(uiop:define-package #:app/app
  (:use #:cl)
  (:import-from #:alexandria
                #:read-file-into-string)
  (:export #:main))
(in-package #:app/app)


(defvar *static-resource-original-path*
  (asdf:system-relative-pathname "app" "resource.txt"))

(defvar *static-resource*
  (read-file-into-string *static-resource-original-path*))


(defun main ()
  (format t "This is the content loaded from ~A file:~2%~A~%"
          *static-resource-original-path*
          *static-resource*)

  (cond
    ((uiop:file-exists-p *static-resource-original-path*)
     (format t "~&I see original file still exists. Rename it or delete to check if content above comes from compiled binary.~%"))
    (t
     (format t "Original file does not exists anymore.~%"))))
