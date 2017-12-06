#!/usr/bin/sbcl --script
;;Author: Jarrett Melnick
;;Program to find the top 10 numbers with the largest Colletz sequence length in a given range

;;-------------------------------------------------------------------------------
(defvar iterate 15)		;;Change this to the max value to be considered
(defvar seq 0)
(defvar identArray)
(defvar seqArray)
(defvar sm 0)
(defvar mx 0)
(defvar small 0)
(defvar large 0)
(defvar curCollatz 0)
(defvar hasSequence 0)
(defvar hs 0)
;;-------------------------------------------------------------------------------
;;Functions:

(defun collatz (num) ;Calculates the length of the Collatz sequence for a number
  (setq seq 0)
(loop
  (when (< num 2) (return seq))
  (if (= (mod num 2) 1) (setq num ( + (* 3 num) 1))(setq num (/ num 2)))
  (setq seq (+ seq 1))
 )
)
(defun smallest (numArray) ;Finds the smallest number in a given array
   (setq sm 1)	
   (dotimes(i 10)
		(when ( < (aref numArray i) (aref numArray sm)) (setq sm i))
 	)
 	(return-from smallest sm)
)
(defun largest (numArray) ;Finds the largest number in a given array
	(setq mx 1)
	(dotimes(i 10)
		(when ( > (aref numArray i) (aref numArray mx)) (setq mx i ))
	)
	(return-from largest mx)
)
(defun printArr (numArray)
	(dotimes(i 10)
	  (format t "~d has a collatz sequence of length ~d~%" i (aref numArray i)))
)
(defun hasSequenceValue (numArray val) ;Returns 1 if value is found in numArray
	(setq hs 0)
	(dotimes(i 10)
	  (when (= (aref numArray i) val)(setq hs 1))
	 )
	(return-from hasSequenceValue hs)
)
;------------------------------------------------------------------------------------
(setf identArray(make-array'(10)))
(setf seqArray(make-array'(10)))

(dotimes(i 10)
  (setf(aref identArray i) 0)
  (setf(aref seqArray i) 0)
 )
(dotimes (j iterate)
  (setq curCollatz (collatz j))
  (setq small (smallest seqArray))
  (setq hasSequence (hasSequenceValue seqArray curCollatz))
  (when (and (< (aref seqArray small) curCollatz)(= hasSequence 0))
  	(setf (aref identArray small) j)
  	(setf (aref seqArray small) curCollatz))
)
(dotimes (i 10)
  (setq large (largest seqArray))
  (format t "~d has a Collatz Sequence of length ~d.~%" (aref identArray large) (aref seqArray large))
  (setf(aref identArray large) 0)
  (setf(aref seqArray large) 0)
)
;(setf(aref seqArray 5) 10)
;(setf(aref seqArray 6) 0)
;(setq large (largest seqArray))
;(format t "Largest index: ~d ~d~%" large (aref seqArray large))
;(printArr seqArray)
;(print(hasSequenceValue seqArray 11))
;(print(hasSequenceValue seqArray 1))
