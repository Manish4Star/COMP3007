;Abdul Bin Asif Niazi
;100917191
;This file contains the mean procedure to find the mean of the
;integers in a list and a helper function to identify if an element
;is an integer
;Test Cases are found below
;This question is written in Scheme R5RS

(define (int-list sequence)
  (cond ((null? sequence) (list 0))
        ((integer? (car sequence)) (cons (car sequence) (int-list (cdr sequence))))
        (else (int-list (cdr sequence)))))

(define (accumulate operator initial sequence)
  (if (null? sequence)
      initial
      (operator (car sequence) (accumulate operator initial (cdr sequence)))))

(define (mean lis)
  (let ((y (int-list lis)))
        (let ((z (accumulate + 0 y)))
          (if (= (length y) 0) 
              "Error, no Numbers in List"
              (/ z (- (length y) 1))))))

;-------------------Test Cases--------------------
(display "TEST CASES:")
(newline)
(display"-----------------")
(newline)
(display "Set Used for Test Cases")
(newline)
(display "(define x (list 1 2 'a 'b 3 'c 5))")
(define x (list 1 2 'a 'b 3 'c 5))
(newline)
(newline)

;find mean of predefined list, expected output is 2(3/4)
(mean x)

;find mean of defined list, expected output is 10(1/2)
(mean (list 1 3 'b 35 'c 'd 'e 3))
    