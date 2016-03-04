;Abdul Bin Asif Niazi
;100917191
;There is the my-length function in this file and its helper function
;the accumulate function
;Test Cases are found below
;This question is written in Scheme R5RS

(define (accumulate operator initial sequence) 
    (if (null? sequence) 
        initial 
        (operator (car sequence) (accumulate operator initial (cdr sequence)))))

(define (my-length sequence)
	(accumulate (lambda (lis-elem counter) (+ 1 counter)) 0 sequence))

;-------------------Test Cases--------------------
(display "TEST CASES:")
(newline)
(display"-----------------")
(newline)
(display "List for Test Cases")
(newline)
(display "(define x (list 1 2 3 4))")
(newline)
(define x (list 1 2 3 4))
(display "(define y (list 2 3 4 5))")
(define y (list 2 3 4 5))
(newline)
(newline)

;find length of list
(display "(my-length x)")
(newline)
(my-length x)
(newline)

;find length of defined list
(display "(my-length (list 4 5 6 4 3))")
(newline)
(my-length (list 4 5 6 4 3))
(newline)