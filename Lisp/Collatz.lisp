#!/usr/bin/sbcl --script
;;Author: Jarrett Melnick
;;Program to find the top 10 numbers with the largest Colletz sequence length in a given range

;;-------------------------------------------------------------------------------
(defvar iterate 15)		;;Change this to the max value to be considered
(defvar seq 0)
(defvar identArray)
(defvar seqArray)
(defvar ident2)
(defvar seq2)
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
;Making the arrays
(setf identArray(make-array'(10))) 
(setf seqArray(make-array'(10)))
(setf ident2(make-array'(10)))
(setf seq2(make-array'(10)))
;setting the arrays to 0
(dotimes(i 10)
  (setf(aref identArray i) 0)
  (setf(aref seqArray i) 0)
  (setf(aref ident2 i) 0)
  (setf(aref seq2 i) 0)
 )
;Creates the list of the collatz sequences
(dotimes (j iterate)
  (setq curCollatz (collatz j))
  (setq small (smallest seqArray))
  (setq hasSequence (hasSequenceValue seqArray curCollatz))
  (when (and (< (aref seqArray small) curCollatz)(= hasSequence 0))
  	(setf (aref identArray small) j)
  	(setf (aref ident2 small) j)
  	(setf (aref seqArray small) curCollatz)
  	(setf (aref seq2 small) curCollatz))
)
(format t "SORTING BY SEQUENCE LENGTH ~%")
(dotimes (i 10)
  (setq large (largest seqArray))
  (format t "~d has a Collatz Sequence of length ~d.~%" (aref identArray large) (aref seqArray large))
  (setf(aref identArray large) 0)
  (setf(aref seqArray large) 0)
)
(format t "SORTING BY INTEGER LENGTH ~%")
(dotimes (i 10)
  (setq large (largest ident2))
  (format t "~d has a Collatz Sequence of length ~d.~%" (aref ident2 large) (aref seq2 large))
  (setf(aref ident2 large) 0)
  (setf(aref seq2 large) 0)
)
