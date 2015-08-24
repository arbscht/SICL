(cl:in-package #:cleavir-simple-value-numbering)

;;; We use instances of this class to designate values.
(defclass value-designator ()
  ())

;;; This variable holds and EQ hash table mapping constants to value
;;; designators.
(defvar *constant-designators*)

(defun constant-designator (constant)
  (let ((result (gethash constant *constant-designators*)))
    (when (null result)
      (setf result (make-instance 'value-designator))
      (setf (gethash constant *constant-designators*) result))
    result))

(defun remove-location (location partition)
  (remove location partition :key #'car :test #'eq))

(defun add-equivalence (location1 location2 partition)
  (cons (cons location1 (cdr (assoc location2 partition :test #'eq)))
	partition))

(defun simple-value-numbering (initial-instruction)
  (declare (ignore initial-instruction))
  (let ((*constant-designators* (make-hash-table :test #'eq)))))

;;  LocalWords:  designator designators