;Abdul Bin Asif Niazi
;100917191
;This file contains the repeat procedure and a helper procedure to
;be applied repeatedly, in this case, its the sqr procedure
;Test Cases are found below
;This question is written in Scheme R5RS

(define (sqr x)
  (* x x))

(define (helper f n x)
  (if (= n 1) (f x) (f (helper (- n 1) x))))

(define (repeated f n)
  
  (define (helper f n x)
    (if (= n 1) (f x) (helper f (- n 1) (f x))))

  (lambda (y) (helper f n y)))
        
;-------------------Test Cases--------------------
(display "TEST CASES:")
(newline)
(display"-----------------")
(newline)
(newline)

;use a predefined procedure to be called repeatedly
;expected output is 256
((repeated sqr 3)2)
(newline)

;use a lambda procedure to be called repeatedly
;expected value is 54
((repeated (lambda (x) (+ x x x)) 3) 2)
(newline)