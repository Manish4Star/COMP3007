;Abdul Bin Asif Niazi
;100917191
;This function allows the user to change the accuracy of the square root function by
;defining a different good-enough function and passing it into sqrt and how many
;iterations, at most, should the algorithm run through
;It's input, x, is the number for which one is looking to find the square root
;It's input, f, is the new good-enough function
;It's input, iter, is the number of maximum iterations the function should run through
;Test cases are found below
;This question is written in Scheme R5RS

;Question9 b)
(define (good-enough1 guess x) 
  (< (abs (- (square guess) x)) 0.001))

(define (good-enough2 guess x) 
  (< (abs (- (square guess) x)) 2))

(define (good-enough3 guess x) 
  (< (abs (- (square guess) x)) 0.1))

(define (average x y) 
  (/ (+ x y) 2))

(define (improve guess x) 
  (average guess ( / x guess)))

(define (sqrt-iteration guess x f iter) 
  (if (> iter 0.0)
      (if (f guess x)
          guess
          (sqrt-iteration (improve guess x) x f (- iter 1)))
      guess))

(define (sqrt x f iter) 
  (sqrt-iteration 1.0 x f iter))

(define (square x) ( * x x))

;-------------------Test Cases--------------------
(display "TEST CASES:")
(newline)
(display"-----------------")
(newline)
;all test cases in this program should produce results less accurate than 9a) as the
;iterations will be kept short, on purpose, to demonstrate the stopping of the recursion

;Base Case: input: x = 16 f = good-enough1 iter = 2, expected output is (sqrt 16 good-enough1 2) > 9a)'s (sqrt 16 good-enough1)
(display "(sqrt 16 good-enough1 2) = ")
(sqrt 16 good-enough1 2)

;2nd good-enough Case: x = 16 f = good-enough2, expected output is (sqrt 16 good-enough2 2) > 9a)'s (sqrt 16 good-enough2)
(display "(sqrt 16 good-enough2 2) = ")
(sqrt 16 good-enough2 2)

;3rd good-enough Case:x = 16 f = good-enough3, expected output is (sqrt 16 good-enough3 2) > 9a)'s (sqrt 16 good-enough3)
(display "(sqrt 16 good-enough3 2) = ")
(sqrt 16 good-enough3 2)

;Test case provided in the assignment, expected output is: 5.406026962727994
(display "(sqrt 25 good-enough1 3) = ")
(sqrt 25 good-enough1 3)