;Abdul Bin Asif Niazi
;100917191
;This function finds the cube root of an input
;It's input, x, is the number for which one is looking to find the cube root
;Test cases are found below
;This question is written in Scheme R5RS

;Question 7
(define (cube x) ( * x x x))

(define (good-enough? guess x) 
    (< (abs (- (cube guess) x)) 0.001))

(define (improve guess x) 
    (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (cube-iteration guess x) 
    (if (good-enough? guess x) 
            guess 
            (cube-iteration (improve guess x) x)))

(define (cbrt x) 
    (if (= x 0) 0 (cube-iteration 1.0 x)))

;-------------------Test Cases--------------------
(display "TEST CASES:")
(newline)
(display"-----------------")
(newline)

;Base Case: input: x = 0, expected output is (cbrt 0) -> (= x 0) -> (#t)
;output: (cbrt 0) = 0
(display "(cbrt 0) = ")
(cbrt 0)

;Upper-bound Case: input: x = 64 , expected output is (cbrt 64) -> (= x 0) -> (#f)
;-> (cube-iteration 1.0 64)
;output: (cbrt 64) = 4
(display "(cbrt 64) = ")
(cbrt 64)

;Lower-bound Case: input: x = 1 , expected output is (cbrt 1) -> (= x 0) -> (#f)
;-> (cube-iteration 1.0 1)
;output: (cbrt 1) = 1
(display "(cbrt 1) = ")
(cbrt 1)

;Negative Upper-bound Case: input: x = -1 , expected output is (cbrt -1) -> (= x 0) -> (#f)
;-> (cube-iteration 1.0 -1)
;output: (cbrt -1) = -1
(display "(cbrt -1) = ")
(cbrt -1)

;Negative Lower-bound Case: input: x = -64 , expected output is (cbrt -64) -> (= x 0) -> (#f)
;-> (cube-iteration 1.0 -64)
;output: (cbrt -64) = -4
(display "(cbrt -64) = ")
(cbrt -64)