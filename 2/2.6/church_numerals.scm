(define zero (lambda (f) (lambda (x) x)))
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
(define (add-1 n)
    (lambda (f) (lambda (x) (f ((n f) x)))))
(define (plus m n)
    (lambda (f) (lambda (x) ((m f) ((n f) x)))))

;test-driver
(define (inc x) (+ 1 x))
((zero inc) 0)
((one inc) 0)
((two inc) 0)
(((add-1 one) inc) 0)
(((add-1 two) inc) 0)
(((plus one two) inc) 0)

(define zero (lambda (f x) x))
(define one (lambda (f x) (f x)))
(define two (lambda (f x) (f (f x))))
(define (add-1 n) 
    (lambda (f x) (f (n f x))))
(define (plus m n)
    (lambda (f x) (m f (n f x))))

;test-driver
(define (inc x) (+ 1 x))
(zero inc 0)
(one inc 0)
(two inc 0)
((add-1 one) inc 0)
((add-1 two) inc 0)
((plus one two) inc 0)
