#!/usr/bin/sbcl --script
;This program will run Collatz conjecture

(defvar recounter)
;Recursive method to do collatz
(defun collatz(x)
      (setf recounter 0)
      (cond ((eq x 1) (return-from collatz 0))
            ((eq (mod x 2) 1) (setf recounter (collatz(+ (* x 3) 1))))  ;Odd number
            (t (setf recounter (collatz(/ x 2))))  ;Even number
      )
      (setf recounter (+ 1 recounter))
      (return-from collatz recounter)
)

(defvar maxnum)
(defvar temp)
(defvar numlist)
(defvar countlist)
(defvar x)
(defvar duplicate)
(defvar smallnum)
(defvar smallcount)
(defvar index)
(defvar counter)
(setf numlist (make-array'(10)))
(setf countlist (make-array'(10)))
(setf maxnum 10000)
      (loop while(/= maxnum 0) do
            (setf x maxnum)
            (setf duplicate 0)
            (setf smallnum  0)
            (setf smallcount (aref countlist 0))
            (setf index 0)
            (setf counter (collatz x))           
            (loop for i from 0 to 9 do
                  ;Updates if current sequence greater than previous sequence
                  (if (> smallcount (aref countlist i))
                  (progn
                        (setf smallcount (aref countlist i))
                        (setf smallnum i)
                  )
                  )
                  ;Check for duplicate sequence
                  (if (eq (aref countlist i) counter)
                  (progn
                        (setf duplicate 1)
                        (setf index i)
                  )
                  )
            )
            (setf temp smallnum)
            ;No duplicates and adds in sequence if sequence greater than current 
            (if (and (> counter (aref countlist temp)) (eq duplicate 0))
            (progn
                  (setf (aref numlist temp) maxnum)
                  (setf (aref countlist temp) counter)
            )
            )
            ;If duplicates adds the smaller number
            (if (and (< maxnum (aref countlist index)) (eq duplicate 1))
                  (setf (aref numlist index) maxnum)
            )
            (setf maxnum (- maxnum 1))
      )
      (loop for j from 0 to 9 do
            (format t "~,2d  ~,2d ~%" (aref numlist j) (aref countlist j))
      )
