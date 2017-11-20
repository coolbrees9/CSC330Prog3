#!/usr/bin/sbcl --script
;This program will run Collatz conjecture
(defvar maxnum 5000000000)
(defvar x)
(defvar counter)
(defvar largest 1)
(defvar largecount 1)
(loop for i from 2 to maxnum do
      (setf counter 1)
      (setf x i)
      (loop while (/= x 1) do
            (if (eq (mod x 2) 1)  ;Odd number
                  (setf x (+ (* x 3) 1))
                  (setf x (/ x 2))  ;Even number
            )
            (setf counter (+ counter 1))
      )
      (if (> counter largecount)
      (progn
            (setf largecount counter)
            (setf largest i)
            (format t "~,2d   ~,2d ~%" largest largecount)
      )
      )
)
