;Abdul Bin Asif Niazi
;100917191
;There are 4 main functions in this file and 3 helper functions
;(add-interval x y) requires inputs of 2 intervals made using the make-interval function
;and adds them as [a,b] + [c,d] = [a+c,b+d]
;(subtract-interval x y) requires inputs of 2 intervals made using the make-interval function
;and subtracts them as [a,b] - [c,d] = [a-d,b-c]
;(multiply-interval x y) requires inputs of 2 intervals made using the make-interval function
;and multiplies them as [a,b] * [c,d] = [min(ac,ad,bc,bd), max(ac,ad,bc,bd)]
;(divide-interval x y) requires inputs of 2 intervals made using the make-interval function
;and divides them as [a,b] / [c,d] = [a,b] * [1/d,1/c] if [c,d] does not contain 0,
;otherwise error
;(make-interval x y) is used to make the intervals that are passed into the 4 main functions
;The two other helper functions are used to get the first and last value of an interval
;Test Cases are found below
;This question is written in Scheme R5RS

(define (make-interval x y)
  (list x y))

(define (getCar x)
  (car x))

(define (getCdr x)
  (car (cdr x)))

(define (add-interval x y)
  (list (+ (getCar x) (getCar y)) (+ (getCdr x) (getCdr y))))
  
(define (subtract-interval x y)
  (list (- (getCar x)  (getCdr y)) (- (getCdr x) (getCar y))))

(define (multiply-interval x y)
 (list (* (if (< (getCar x) (getCdr x)) (getCar x) (getCdr x))
          (if (< (getCar y) (getCdr y)) (getCar y) (getCdr y)))
       (* (if (> (getCar x) (getCdr x)) (getCar x) (getCdr x))
          (if (> (getCar y) (getCdr y)) (getCar y) (getCdr y)))))

(define (divide-interval x y)
  (cond ((= (getCar y) 0) "Error in second argument, contains 0")
        ((= (getCdr y) 0) "Error in second argument, contains 0")
        (else (multiply-interval x (list (/ 1 (getCdr y)) (/ 1 (getCar y)))))))

;-------------------Test Cases--------------------
(display "TEST CASES:")
(newline)
(display"-----------------")
(newline)
(display "Intervals Used for Test Cases")
(newline)
(display "(define first (make-interval 5 10))")
(newline)
(display "(define second (make-interval 2 7))")
(newline)
(display "(define third (make-interval 7 2))")
(newline)
(display "(define fourth (make-interval 2 0))")
(define first (make-interval 5 10))
(define second (make-interval 2 7))
(define third (make-interval 7 2))
(define fourth (make-interval 2 0))
(newline)
(newline)

;Addition Case: input: x = [5 10] y = [2 7] , expected output is (7 17)
(display "(add-interval first second)")
(newline)
(add-interval first second)
(newline)

;Subtraction Case: input: x = [5 10] y = [2 7] , expected output is (-2 8)
(display "(subtract-interval first second)")
(newline)
(subtract-interval first second)
(newline)

;Multiplication Base Case: input: x = [5 10] y = [2 7] , expected output is (10 70)
(display "(multiply-interval first second)")
(newline)
(multiply-interval first second)
(newline)

;Multiplication reverse Case: input: x = [5 10] y = [7 2] , expected output is (10 70)
(display "(multiply-interval first third)")
(newline)
(multiply-interval first third)
(newline)

;Division Case: input: x = [5 10] y = [7 2] , expected output is (5/2 5)
(display "(divide-interval first third)")
(newline)
(divide-interval first third)
(newline)

;Division Zero Case: input: x = [5 10] y = [2 0] , expected output is ERROR
(display "(divide-interval first fourth)")
(newline)
(divide-interval first fourth)
(newline)


