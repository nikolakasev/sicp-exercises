#lang racket

10

(define a 3)
(define b (+ a 1))

(= a b)

(if (and (> b a) (< b (* a b)))
    b
    a)

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))

(+ 2 (if (> b a) b a))

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

(define (square x) (* x x))

(square 10)

(define (>= x y)
  (or (> x y) (= x y)))

(define (sum-squares a b)
  (+ (square a) (square b)))

(define (square-of-largest-two a b c)
  (cond ((>= a b) (cond ((>= b c) (sum-squares a b)) (else (sum-squares a c))))
        ((>= b c) (cond ((>= c a) (sum-squares b c)) (else (sum-squares b a))))
        ((>= c a) (cond ((>= a b) (sum-squares c a)) (else (sum-squares c b))))))

(square-of-largest-two 3 1 2)

