;Abdul Bin Asif Niazi
;100917191
;This file contains the intersection procedure to and a helper procedure
;to identify matches
;Test Cases are found below
;This question is written in Scheme R5RS

(define (match a b)
  (cond ((null? b) #f)
        ((eq? a (car b)) #t)
        (else (match a (cdr b)))))

(define (intersection-set-iter set1 set2)
  (if (null? set1) '() 
      (let ((found (match (car set1) set2)))
        (cond ((null? set1) '(()))
              (found (cons (car set1) (intersection-set-iter (cdr set1) set2)))
              (else (intersection-set-iter (cdr set1) set2))))))
           
;-------------------Test Cases--------------------
(display "TEST CASES:")
(newline)
(display"-----------------")
(newline)
(display "Sets Used for Test Cases")
(newline)
(display "(define set1 (list 1 2 3 4 5))")
(newline)
(display "(define set2 (list 1 2 4 6 5 10))")
(define set1 (list 1 2 3 4 5))
(define set2 (list 1 2 4 6 5 10))
(newline)
(newline)

;find intersection of two predefined lists, expected output is
;(1 2 4 5)
(intersection-set-iter set1 set2)

;find intersection of a predefined and a defined list, expected
;output is (1 2 5 6 10)
(intersection-set-iter (list 1 2 3 5 6 10 11) set2)

  