#!/usr/bin/sbcl --script
;This program will run Collatz conjecture

(defvar swapNum)
(defvar swapCount)
;Method that does bubblesort
(defun bubbleSort(numlist countlist)
      (loop for x from 0 to 9 do
            (loop for y from 0 to (- 8 x) do
                  (if (< (aref numlist y)(aref numlist (+ y 1)))
                  (progn
                        (setf swapNum (aref numlist y))
                        (setf (aref numlist y) (aref numlist (+ y 1)))
                        (setf (aref numlist (+ y 1)) swapNum)
                        (setf swapCount (aref countlist y))
                        (setf (aref countlist y) (aref countlist (+ y 1)))
                        (setf (aref countlist (+ y 1)) swapCount)
                  )
                  )
            )
      )
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
            (setf counter 0)
            ;Loop to do collatz
            (loop while (/= x 1) do
                  (if (eq (mod x 2) 1)  ;Odd number
                        (setf x (+ (* x 3) 1))
                        (setf x (/ x 2))  ;Even number
                  )
                  (setf counter (+ counter 1))
            )
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
      ;Method to do bubblesort
      (bubbleSort countlist numlist)
      (format t "Sequence sorted by sequence length ~%")
      (loop for j from 0 to 9 do
            (format t "~,2d  ~,2d ~%" (aref numlist j) (aref countlist j))
      )
      (terpri)
      ;Method to do bubblesort
      (bubbleSort numlist countlist)
      (format t "Sequence sorted by integer size ~%")
      (loop for j from 0 to 9 do
            (format t "~,2d  ~,2d ~%" (aref numlist j) (aref countlist j))
      )
