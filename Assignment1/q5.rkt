;Abdul Bin Asif Niazi
;100917191
;This file contains two functions that find the product of all the numbers from a to b
;This file contains one functions that finds the factorial of x (fac x)
;Inputs a and b are the min and max of a range
;a <= b
;Test cases are found below
;(product-rec a b) is the tail-end recursive function
;(product-rec2 a b) is the iterative process recursion
;This question is written in Scheme R5RS

;Question 5
;a
(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

(define (inc x) (+ x 1))
(define (identity x) x)
(define (product-integers a b)
	(product identity a inc b))

(define (product-rec a b)
  (if (= a b) a (product identity a inc b)))

;b
(define (fac x)
  (if (= x 0) 1 (product identity 1 inc x)))

;c
(define (product-it term a next b total)
  (if (> a b)
    total
    (product-it term (inc a) next b (* total a))))

(define (product-rec2 a b)
  (if (= a b) a (product-it identity a inc b 1)))

;-------------------Test Cases--------------------
(display "TEST CASES:")
(newline)
(display"-----------------")
(newline)

;Base Case tail-end: input: a = b = 5, expected output (product-rec 5 5) = 5
(display "(product-rec 5 5) = ")
(product-rec 5 5)

;Base Case iterative: input: a = b = 5, expected output is (product-rec2 5 5) = 5 
(display "(product-rec2 5 5) = ")
(product-rec2 5 5)

;negatives Case tail-end: input a = -10 b = -8, expected output is (product-rec -10 -8) = -720
(display "(product-rec -10 -8) = ")
(product-rec -10 -8)

;negatives Case iterative: input a = -10 b = -8, expected output is (product-rec2 -10 -8) = -720
(display "(product-rec2 -10 -8) = ")
(product-rec2 -10 -8)

;factorial base case: input x = 0, expected output is (fac 0) = 1
(display "(fac 0) = ")
(fac 0)

;factorial high value: input x = 5, expected output is (fac 5) = 120
(display "(fac 5) = ")
(fac 5)