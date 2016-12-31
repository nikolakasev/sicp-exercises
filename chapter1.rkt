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

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 5 -10)

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(define (average x y)
  (/ (+ x y) 2))

(average 5 4)

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
  (else else-clause)))

(new-if (= 2 3) 0 5)

(define (cube x) (* x x x))

(cube 2)

(define (good-enough-cube? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (improve-cube guess x)
  (/ (+ (/ x (square guess)) (* 2 guess))
     3))

(define (cube-iter guess x)
  (if (good-enough-cube? guess x)
      guess
      (cube-iter (improve-cube guess x) x)))

(define (cube-root x)
  (cube-iter 1.0 x))

(cube-root 125)