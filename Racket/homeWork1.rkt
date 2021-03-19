#lang racket
(define (concat1 l1 l2)
  (append l1 l2)
  )

(define (concat2 l1 l2)
  (append l2 l1)
  )

#! Escreva uma função para concatenar uma lista de listas.
(define (concat3 l1 [l2 '()])
  (if
    (null? l1) l2
    (concat3 (rest l1)(append l2 (first l1)))
  ) 
)

#! Escreva as cláusulas para juntar duas listas, intercalando seus elementos.
(define (merge1 l1 l2)
  (cond
    [(null? l1) l2]
    [(null? l2) l1]
    [else (append (list (first l1)) (list (first l2)) (merge1 (rest l1) (rest l2)))]
  )
)

#! Escreva uma função para adicionar um elemento ao final de uma lista.
(define (addAtom a l1)
  (append l1 (list a))
)

#! Escreva uma função para inverter uma lista.
(define (inverseList l1 [l2 '()])
  (if (null? l1)
      l2
      (inverseList (rest l1) (cons (first l1) l2))
  )
)

#! Escreva uma função para criar uma lista intercalada de tamanho N, de dois elementos e1 e e2.
