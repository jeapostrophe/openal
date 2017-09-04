#lang racket/base
(require racket/contract
         racket/match
         racket/dict
         ffi/vector
         openal
         (only-in rackunit dynamic-require/expose))

(define alBufferData/path
  (let ([sample-type #f]
        [read-sound-internal #f])
    (λ (b file)
      (unless read-sound-internal
        (set! read-sound-internal
              (dynamic-require/expose 'ffi/examples/sndfile 'read-sound-internal))
        (set! sample-type
              (dynamic-require/expose 'ffi/examples/sndfile 'sample-type)))

      (define-values (data meta)
        (parameterize ([sample-type 'short])
          (read-sound-internal file)))
      (define frames (car (dict-ref meta 'frames)))
      (define rate (car (dict-ref meta 'samplerate)))
      (define channels (car (dict-ref meta 'channels)))
      (define bytes-per-frame (* 2 channels))
      (define data-size (* frames bytes-per-frame))
      (alBufferData b
                    (if (channels . > . 1) AL_FORMAT_STEREO16 AL_FORMAT_MONO16)
                    (s16vector->cpointer data)
                    data-size
                    rate))))

(provide/contract
 [alBufferData/path (-> integer? path-string? void?)])
