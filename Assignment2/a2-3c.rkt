;Abdul Bin Asif Niazi
;100917191
;This file contains the triple procedure and the first, second, third
;procedures to access the values
;Test Cases are found below
;This question is written in Scheme R5RS

(define (triple x y z)
  (let ((first x)
        (second y)
        (third z))
    (define (dispatch which)
      (cond ((eq? which 'first) first)
            ((eq? which 'second) second)
            ((eq? which 'third) third)))
    dispatch))

(define (first trip)
  (trip 'first))

(define (second trip)
  (trip 'second))

(define (third trip)
  (trip 'third))

;-------------------Test Cases--------------------
(display "TEST CASES:")
(newline)
(display"-----------------")
(newline)
(display "triplet for Test Cases")
(newline)
(display "(define a (triple 1 2 3))")
(newline)
(define a (triple 1 2 3))
(newline)
(newline)

;get the first element, expeected output is 1
(first a)
(newline)

;get the second element, expected output is 2
(second a)
(newline)

;get the third element, expected output is 3
(third a)
(newline)