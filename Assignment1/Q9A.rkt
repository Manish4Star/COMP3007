;Abdul Bin Asif Niazi
;100917191
;This function allows the user to change the accuracy of the square root function by
;defining a different good-enough function and passing it into sqrt
;It's input, x, is the number for which one is looking to find the square root
;It's input, f, is the new good-enough function
;Test cases are found below
;This question is written in Scheme R5RS

;Question 9 a)
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

(define (sqrt-iteration guess x f) 
  (if (f guess x) 
      guess 
      (sqrt-iteration (improve guess x) x f)))

(define (sqrt x f) 
  (sqrt-iteration 1.0 x f))

(define (square x) ( * x x))

;-------------------Test Cases--------------------
(display "TEST CASES:")
(newline)
(display"-----------------")
(newline)

;Base Case: input: x = 16 f = good-enough1, expected output is (sqrt 16 good-enough1) < 4.1.....
(display "(sqrt 16 good-enough1) = ")
(sqrt 16 good-enough1)

;2nd good-enough Case: x = 16 f = good-enough2, expected output is (sqrt 16 good-enough2) <= 6
(display "(sqrt 16 good-enough2) = ")
(sqrt 16 good-enough2)

;3rd good-enough Case:x = 16 f = good-enough3, expected output is (sqrt 16 good-enough3) < 4.1
(display "(sqrt 16 good-enough3) = ")
(sqrt 16 good-enough3)