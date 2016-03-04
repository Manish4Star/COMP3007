;Abdul Bin Asif Niazi
;100917191
;This file contains the subset procedure to find the 2^n subsets of
;a given set
;Test Cases are found below
;This question is written in Scheme R5RS

(define (subsets set)
  (if (null? set)
      '(())
      (let ((remaining (subsets (cdr set))))
        (append (map (lambda (x) (cons (car set) x))remaining)
                remaining))))

;-------------------Test Cases--------------------
(display "TEST CASES:")
(newline)
(display"-----------------")
(newline)
(display "Set Used for Test Cases")
(newline)
(display "(define a (list 1 2 3))")
(newline)
(define a (list 1 2 3))
(newline)
(newline)

;find subsets of predefined set (1 2 3), expected output is
;(1 2 3) (1 2) (1 3) (1) (2 3) (2) (3) ()
(subsets a)

;find subset of a defined set (4 5 6) expected output is
;(4 5 6) (4 5) (4 6) (4) (5 6) (5) (6) ()
(subsets (list 4 5 6))