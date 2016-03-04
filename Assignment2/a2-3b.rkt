;Abdul Bin Asif Niazi
;100917191
;This file contains the special-car, special-cdr and special-cons
;procedures
;Test Cases are found below
;This question is written in Scheme R5RS

(define (special-cons x y)
  (let ((ca x)
        (cd y))
    (define (dispatch which)
      (cond ((eq? which 'ca) ca)
            ((eq? which 'cd) cd)
            (else "query does not exist")))
    dispatch))

(define (special-car pair)
  (pair 'ca))

(define (special-cdr pair)
  (pair 'cd))

;-------------------Test Cases--------------------
(display "TEST CASES:")
(newline)
(display"-----------------")
(newline)
(display "Pair for Test Cases")
(newline)
(display "(define test (special-cons 1 2))")
(newline)
(define test (special-cons 1 2))
(newline)
(newline)

;get car of pair, expected output is 1
(special-car test)
(newline)

;get cdr of pair, expected output is 2
(special-cdr test)
(newline)

