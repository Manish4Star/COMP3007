;Abdul Bin Asif Niazi
;100917191
;There is the my-map function in this file and its helper function
;the accumulate function
;Test Cases are found below
;This question is written in Scheme R5RS


(define (accumulate operator initial sequence) 
    (if (null? sequence) 
        initial 
        (operator (car sequence) (accumulate operator initial (cdr sequence)))))

(define (my-map proc sequence)
  (accumulate (lambda (x y) (cons (proc x) y)) '() sequence))


;-------------------Test Cases--------------------
(display "TEST CASES:")
(newline)
(display"-----------------")
(newline)
(display "List for Test Cases")
(newline)
(display "(define x (list 1 2 3 4 5))")
(define x (list 1 2 3 4 5))
(newline)
(newline)

;Passing in a lambda to accumulate
(display "(my-map (lambda (x) (* x x)) x)")
(newline)
(my-map (lambda (x) (* x x)) x)
(newline)

;passing in predefined cube function
(display "(define (cube x) (* x x x))")
(newline)
(define (cube x) (* x x x))
(my-map cube x)
(newline)