;Abdul Bin Asif Niazi
;100917191
;The new-if function will not work and causes an infinite loop becuase
;the recursive call will keep occuring because scheme is an applicative language
;so the recursive call will keep occuring without any of the cond being evaluated
;This question is written in Scheme R5RS

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

(define (inner guess x f iter)
  (new-if (f guess x) guess (sqrt-iteration (improve guess x) x f (- iter 1))))

;(define (inner guess x f iter)
 ; (new-if (f guess x) guess (sqrt-iteration (improve guess x) x f (- iter 1))))

(define (outer guess x f iter)
  (new-if (> iter 0.0) (inner x guess f iter) guess))

(define (sqrt-iteration guess x f iter)
  (display iter)
  (new-if (> iter 0.0) (new-if (f guess x) guess (sqrt-iteration (improve guess x) x f (- iter 1))) guess))

(define (new-if predicate consequent alternate)
   (cond (predicate consequent)
         (else alternate)))

(define (sqrt x f iter) 
  (sqrt-iteration 1.0 x f iter))

(define (square x) ( * x x))