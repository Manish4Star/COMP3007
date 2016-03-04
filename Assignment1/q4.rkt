;Abdul Bin Asif Niazi
;100917191
;This file contains two functions that sum all the numbers from a to b
;It's inputs, a and b, are the min and max of a range
;a <= b
;Test cases are found below
;(sum-integers a b) is the tail-end recursive function
;(sum-integers2 a b) is the iterative process recursion
;This question is written in Scheme R5RS

;Question 4
(define (inc x) (+ x 1))

(define (identity x) x)

;Tail-end recursive function
(define (sum-integers a b)
  (if (= a b) a
	(sum identity a inc b)))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (sum2 term a next b total)
  (if (> a b)
    total
    (sum2 term (inc a) next b (+ a total))))

;iterative recursive function
(define (sum-integers2 a b)
  (if (= a b) a
	(sum2 identity a inc b 0)))

;-------------------Test Cases--------------------
(display "TEST CASES:")
(newline)
(display"-----------------")
(newline)

;Base Case tail-end: input: a = b = 5, expected output (sum-integers 5 5) = 5
(display "(sum-integers 5 5) = ")
(sum-integers 5 5)

;Base Case iterative: input: a = b = 5, expected output is (sum-integers2 5 5) = 5 
(display "(sum-integers2 5 5) = ")
(sum-integers2 5 5)

;negatives Case tail-end: input a = -10 b = -5, expected output is (sum-integers -10 -5) = -39 -> 
(display "(sum-integers -10 -5) = ")
(sum-integers -10 -5)

;negatives Case iterative: input a = -10 b = -5, expected output is (sum-integers2 -10 -5) = -39 -> 
(display "(sum-integers2 -10 -5) = ")
(sum-integers2 -10 -5)
