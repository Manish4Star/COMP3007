;Abdul Bin Asif Niazi
;100917191
;File is broken down into 5 parts
;Part 1 consists of code taken from Prof. Runka's notes
;Part 2 contains stream analogues of some list processing functions
;Part 3 consists of stream generators to help test Part 1
;Part 4 contains the partial-sums functions
;Part 5 is test cases
;Test Cases are found below
;This question is written in Scheme R5RS
(#%require (only racket/base random))

;Part 1 - code taken from COMP3007 website
;-----------------------------------
(define-syntax cons-stream
  (syntax-rules ()
    ((cons-stream a b)(cons a (delay b)))))

(define (stream-car s)(car s))

(define (stream-cdr s)(force (cdr s)))

(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))

(define integers (integers-starting-from 1))

(define (stream-null? stream ) 
     (null? stream))

(define the-empty-stream '())

(define (divisible? x y) (= (remainder x y) 0))

;-----------------------------------


;Part 2 - Stream analogues of list processing functions
;-----------------------------------

;returns the nth value for the stream str
(define (stream-ref str n)
  (cond ((= n 0) (stream-car str))
        (else (stream-ref (stream-cdr str) (- n 1)))))

;returns a filtered stream satisfying the predicate, from Prof. Runka's website
(define (stream-filter predicate stream) 
     (cond  ((stream-null? stream) the-empty-stream) 
                  ((predicate (stream-car stream)) 
                           (cons-stream (stream-car stream) 
                                                (stream-filter predicate (stream-cdr stream)))) 
                  (else  (stream-filter predicate (stream-cdr stream)))))

;applies proc to each element of str, from Prof. Runka's website
(define (stream-map procedure stream )
  (if (stream-null? stream )
      the-empty-stream
      (cons-stream (procedure (stream-car stream ))
                   (stream-map procedure (stream-cdr stream )))))

;makes a new stream of the first n items in str
(define (first n str)
  (cond ((<= n 0) '())
        (else (cons-stream (stream-car str) (first (- n 1) (stream-cdr str))))))

;makes a stream from list lis
(define (list->stream lis)
  (cond ((null? (car lis)) '())
         (else (cons-stream (car lis) (list->stream (cdr lis))))))

;makes a list from a stream str
(define (stream->list str)
  (cond ((null? str) '())
        (else (cons (stream-car str) (stream->list (stream-cdr str))))))
;-----------------------------------


;Part 3 - Stream Generators to test Part 2 functions
;-----------------------------------

;infinite list of 1
(define (infinite-ones)
  (cons-stream 1 (infinite-ones)))

;an infinite stream of all odd integers
(define infinite-odds (stream-filter (lambda (x) (not (divisible? x 2))) integers))

;an infinite stream of random numbers between 1 and 100
(define (rand-ints)
  (cons-stream (+ 1 (random 100)) (rand-ints)))

;an infinite stream of the values of function
;f(n) = f(n-1) + 2f(n-2) + 3f(n-3) (given f(n)=n iff n<4)
(define (infinite-func n)
  (cond ((< n 4) (cons-stream n (infinite-func (+ n 1))))
        (else
         (cons-stream
          (+ (stream-car (infinite-func (- n 1))) (* (stream-car (infinite-func (- n 2))) 2) (* (stream-car (infinite-func (- n 3))) 3) )
          (infinite-func (+ n 1))))))
;-----------------------------------


;Part 4 - Partial-Sums functons
;-----------------------------------

;produces a stream of partial sums when given a stream of positive integers
(define (partial-sums pos-ints)
  (define (rec instr pev)
    (cons-stream (+ pev (stream-car instr)) (rec (stream-cdr instr) (+ pev (stream-car instr)))))
  (rec pos-ints 0))

;-----------------------------------


;-------------------Test Cases--------------------
(display "TEST CASES:")
(newline)
(display"-----------------")
(newline)

(display "Test case for stream-ref using the integers stream. Function should output
the positive integer at position 5. Positions start at 0.\n")
(display "(stream-ref integers 5) ---> Expected output: 6\n")
(stream-ref integers 5)
(newline)

(display "Test case for stream-filter, using the divisible function and the integers
stream. Stream created called even\n")
(display "(define even (stream-filter (lambda (x) (divisible? x 2)) integers))\n")
(display "(stream-ref even 5) ----> expected output: 12\n")
(define even (stream-filter (lambda (x) (divisible? x 2)) integers))
(stream-ref even 5)
(newline)

(display "Test case for the stream-map function, using the integers stream
and the (square x) function.\n")
(display "(define double (stream-map (lambda (x) (square x)) integers))\n")
(display "(stream-ref double 5), should square the element at position 5 of the integers
stream ----> expected output: 36\n")
(define (square x) (* x x))
(define double (stream-map (lambda (x) (square x)) integers))
(stream-ref double 5)
(newline)

(display "test case for (first n str), using the integers stream\n")
(display "(define y (first 5 integers))
(stream-ref y 4 ---> expected output: 5\n")
(define y (first 5 integers))
(stream-ref y 4)
(newline)

(display "test case for (list->stream lis), using (define test (list 1 2 3 4))\n")
(display "(define test2 (list->stream test))\n")
(display "expected output of test2: (1 . #<promise>)\n")
(define test (list 1 2 3 4))
(define test2 (list->stream test))
test2
(newline)

(display "test case for the (stream->list str) function, using the y stream created
earlier: (define test3 (stream->list y))\n")
(display "expected value of test3 (1 2 3 4 5)\n")
(define test3 (stream->list y))
test3
(newline)

(display "testing the infinite-ones function\n")
(display "(stream->list (first 5 (infinite-ones))) --> expected output
(1 1 1 1 1)\n")
(stream->list (first 5 (infinite-ones)))
(display "(stream->list (first 20 (infinite-ones))) --> expected output
(1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1)\n")
(stream->list (first 20 (infinite-ones)))
(newline)

(display "test case for an infinite stream of odd numbers\n")
(display "(stream-ref infinite-odds 0) --> expected output:
1\n")
(stream-ref infinite-odds 0)
(display "(stream-ref infinite-odds 10) --> expected output:
21\n")
(stream-ref infinite-odds 10)
(newline)

(display "test case for (rand-ints), which returns an infinite stream of
random number between 1 and 100\n")
(display "(steam->list (first 10 (rand-ints))) ----> expected out:
10 random integers from 1 to 100\n")
(stream->list (first 10 (rand-ints)))
(newline)

(display "test case for creating infinite stream of 
f(n) = f(n-1) + 2f(n-2) + 3f(n-3) (given f(n)=n iff n<4)\n")
(display "(stream->list (first 10 test10)) --> expected output is 
(1 2 3 10 22 51 ...\n")
(define test10 (infinite-func 1))
(stream->list (first 10 test10))
(newline)

(display "test cases for partial-sums pos-ints)\n")
(display "(stream->list (first 5 (partial-sums integers))) --> expected output:
(1 3 6 10 15)\n")
(stream->list (first 5 (partial-sums integers)))
(display "(stream->list (first 10 (partial-sums (infinite-ones)))) --> expected output:
(1 2 3 4 5 6 7 8 9 10)\n")
(stream->list (first 10 (partial-sums (infinite-ones))))
    
