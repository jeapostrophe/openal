#lang setup/infotab
(define collection "openal")
(define deps
  (list "base"
        "racket-doc"
        "rackunit-lib"
       ))
(define build-deps
  (list "scribble-lib"
       ))
(define scribblings '(("openal.scrbl" ())))
