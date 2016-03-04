;Abdul Bin Asif Niazi
;100917191
;This file contains the special-car and special-cdr procedures for the 
;special-cons procedure
;Test Cases are found below
;This question is written in Scheme R5RS

(define (special-cons x y)
   (lambda (m) (m x y)))

(define (special-car set)
  (set (lambda (x y) x)))

(define (special-cdr set)
  (set (lambda (x y) y)))


;-------------------Test Cases--------------------
(display "TEST CASES:")
(newline)
(display"-----------------")
(newline)
(display "List for Test Cases")
(newline)
(display "(define m (special-cons 1 2))")
(newline)
(define m (special-cons 1 2))
(newline)
(newline)

;get the car of predefined pair, expected output is 1
(special-car m)
(newline)

;get the cdr of predefined pair, expected output is 2
(special-cdr m)
(newline)

;get car of defined pair, expected output is x
(special-car (special-cons 'x 'y))
(newline)

;get cdr of defined paid, expected output is y
(special-cdr (special-cons 'x 'y))
(newline)