#lang racket
(define (append2 lhs rhs)
  (if (empty? lhs)
      rhs
      (cons (first lhs) (append2 (rest lhs) rhs))))

(define (sequencia n)
  (cond
    [(< n 1) '()]
    [(append2 (sequencia (- n 1)) (list n))]
  )
)

(define (sequencia2 n a)
  (cond
    [(< n 1) '()]
    [(append2 (sequencia2 (- n 1) a) (list (+ n a)))]
  )
)



(define (atom? x)
  (and (not (null? x))
       (not (pair? x))))

(define (prof-lg lg)
  (cond ((null? lg) 0)
        ((atom? lg) 0)
        (else (max (+ 1 (prof-lg (car lg)))
                   (prof-lg (cdr lg))))))


(define (aplanar  l)
  (cond [(atom? l) (list l)]
        [(null? l) '()]
      [else(append2  (aplanar (first l)) (aplanar  (rest l)))]))


