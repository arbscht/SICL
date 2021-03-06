(cl:in-package #:sicl-read)

(defmethod cleavir-i18n:report-condition
    ((condition unmatched-right-parenthesis)
     stream
     (language cleavir-i18n:english))
  (format stream "Unmatched right parenthesis found."))

(defmethod cleavir-i18n:report-condition
    ((condition only-dots-in-token)
     stream
     (language cleavir-i18n:english))
  (format stream "A token with only dots in it was found"))

(defmethod cleavir-i18n:report-condition
    ((condition single-dot-token)
     stream
     (language cleavir-i18n:english))
  (format stream "A token consisting of a single dot was found ~@
                  in a context that does not permit such a token."))

(defmethod cleavir-i18n:report-condition
    ((condition no-object-preceding-dot)
     stream
     (language cleavir-i18n:english))
  (format stream "A left parenthesis cannot be ~
                  immediately followed by a dot"))

(defmethod cleavir-i18n:report-condition
    ((condition multiple-objects-following-dot)
     stream
     (language cleavir-i18n:english))
  (format stream "A second expression following a dot~@
                  inside a list was found: ~S."
	  (offending-expression condition)))
