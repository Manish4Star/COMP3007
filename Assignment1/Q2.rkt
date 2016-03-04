;Abdul Bin Asif Niazi
;100917191
;These two functions require an integer as an input value. The input value is outputted
;if the input value is less than 4. If it is 4 or greater, the output value is the sum
;(input-1) + 2*(input-2) + 3*(input -3) + 4*(input-4). Question 2 a) computes the sum
;using tail-end recursion whereas Question 2 b) computes the sum also using recursion,
;but does so using an iterative process. The Test cases are found below
;This question is written in Scheme R5RS

;Question 2
;a
(define (rec x)
  (if(< x 4)
     x
     (+ (rec (- x 1)) (* 2 (rec (- x 2))) (* 3 (rec (- x 3))) (* 4 (rec (- x 4))))))

;b
(define (rec2 x)
  (if (< x 4)
      x
      (rec-it 3 2 1 0 x)))

(define (rec-it a b c d count)
  (if (< count 4)
      a
      (rec-it (+ a (* 2 b) (* 3 c) (* 4 d)) a b c (- count 1))))

;-------------------Test Cases--------------------
(display "TEST CASES:")
(newline)
(display"-----------------")
(newline)
;---Test Cases for a)
(display "TEST CASES FOR a)")
(newline)
(display"-----------------")
(newline)
;Base Case: input = 4, expected output is f(4) = f(4-1) + 2*f(4-2) + 3*f(4-3) + 4*f(4-4)
;output: f(4) = f(3) + 2*f(2) + 3*f(1) + 4*f(0) = 3 + 2*2 + 3*1 + 4*0
;output: f(4) = 3 + 4 + 3 + 0 = 10
(rec 4)

;Upper-bound Case: input = 5, expected output is f(5) = f(5-1) + 2*f(5-2) + 3*f(5-3) + 4*f(5-4)
;output: f(5) = f(4) + 2*f(3) + 3*f(2) + 4*f(1) = 10 + 2*3 + 3*2 + 4*1
;output: f(5) = 10 + 6 + 6 + 4 = 26
(rec 5)

;Lower-bound Case: input = 0, expected output is f(0) = 0
(rec 0)

(newline)
;---Test Cases for b)
(display "TEST CASES FOR b)")
(newline)
(display"-----------------")
(newline)
;Base Case: input = 4, expected output is f(4) = f(4-1) + 2*f(4-2) + 3*f(4-3) + 4*f(4-4)
;output: f(4) = f(3) + 2*f(2) + 3*f(1) + 4*f(0) = 3 + 2*2 + 3*1 + 4*0
;output: f(4) = 3 + 4 + 3 + 0 = 10
(rec2 4)

;Upper-bound Case: input = 5, expected output is f(5) = f(5-1) + 2*f(5-2) + 3*f(5-3) + 4*f(5-4)
;output: f(5) = f(4) + 2*f(3) + 3*f(2) + 4*f(1) = 10 + 2*3 + 3*2 + 4*1
;output: f(5) = 10 + 6 + 6 + 4 = 26
(rec2 5)

;Lower-bound Case: input = 0, expected output is f(0) = 0
(rec2 0)