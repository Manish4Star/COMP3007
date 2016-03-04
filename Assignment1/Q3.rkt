;Abdul Bin Asif Niazi
;100917191
;This function finds the value of the entry in Pascal's triangle
;It's inputs, x and y, are the row and column of the entry one is looking for
;Both row and column being with 0 and column must be <= row
;Test cases are found below
;This question is written in Scheme R5RS

;Question 3
(define (pascals x y)
  (cond ((= y x) 1)
        ((= y 0) 1)
        ((< x y) "invalid entry")
        ((> x y) (/ (fac x) (* (fac y) (fac (- x y)))))))

(define (fac x)
  (cond ((= x 0) 1)
        ((> x 0) (* x (fac (- x 1))))))

;-------------------Test Cases--------------------
(display "TEST CASES:")
(newline)
(display"-----------------")
(newline)

;Base Case: input: x = 4 y = 0, expected output is (pascal 0 0) -> (= y 1) -> (#t)
;output: (pascals 0 0) = 0
(display "(pascals 0 0) = ")
(pascals 0 0)

;2nd condition Case: input: x = 10 y = 10, expected output is (pascals 10 10) -> 
;(= x y) -> (#t)
;output: (pascals 10 10) = 1
(display "(pascals 10 10) = ")
(pascals 10 10)

;3rd condition Case: input: x = 5 y = 10, expected output is (pascals 5 10) -> 
;(< x y) -> (#t)
;output: (pascals 10 10) = invalid entry
(display "(pascals 5 10) = ")
(pascals 5 10)

;provided cases from assignment:
(display "(pascals 2 1) = ")
(pascals 2 1)
(display "(pascals 4 2) = ")
(pascals 4 2)