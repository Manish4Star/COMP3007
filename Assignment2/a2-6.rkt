(define atom?
  (lambda (x) (and (not (pair? x)) (not (null? x)))))

(define (depth x)
  (cond ((atom? x) 0)
        ((not (null? (car x))) (+ 1 (depth (car x))))
        ((not (null? (cdr x))) (depth (cdr x)))))

(define x (list 1 2 3))
(define y '(((((a(((b)))))))))

(depth 1) ; 0

(depth '(a)) ;1

(depth (list 1 2)) ;1

(depth x) ;

(depth y)