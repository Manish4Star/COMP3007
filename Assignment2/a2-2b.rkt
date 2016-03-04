;Abdul Bin Asif Niazi
;100917191
;There is the my-append function in this file and its helper function
;the accumulate function
;Test Cases are found below
;This question is written in Scheme R5RS


(define (accumulate operator initial sequence) 
    (if (null? sequence) 
        initial 
        (operator (car sequence) (accumulate operator initial (cdr sequence)))))

(define (my-append seq1 seq2)
    (accumulate cons seq2 seq1))


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

;appending two predefined lists
(display "(my-append x y)")
(newline)
(my-append x y)
(newline)

;appending list to predefined list
(display "(my-append x (list 9 8 7 6 5))")
(newline)
(my-append x (list 9 8 7 6 5))
(newline)
