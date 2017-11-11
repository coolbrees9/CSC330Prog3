#!/usr/bin/sbcl --script
;This program will run Collatz conjecture
(defvar x)
(defvar counter 0)
(write-line "Enter a number...")
(setf x (read))  ;Gets user input
(if (<= x 1)
      (write-line "Invalid number")
)
(loop while (/= x 1) do
      (if (eq (mod x 2) 1)  ;Odd number
            (setf x (+ (* x 3) 1))
            (setf x (/ x 2))  ;Even number
      )
      (setf counter (+ counter 1))
      (format t "X = ~,2d   Sequence = ~,2d ~%" x counter)
)
