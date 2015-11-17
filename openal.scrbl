#lang scribble/manual
@require[@for-label[openal
                    racket/base]]

@title{OpenAL}
@author{Jay McCarthy}

@defmodule[openal]

The @racketmodname[openal] module provides FFI bindings to the
@link["https://www.openal.org"]{OpenAL} library. It is intended to
include all functions and constants with their obvious interpretation
as Racket functions, without any additional conveniences from the C
specification.

@section{Filling Buffer Data from Files}

@defmodule[openal/path]

@defproc[(alBufferData/path [b integer?]
                            [p path-string?])
         void?]{

Uses @link["http://www.mega-nerd.com/libsndfile/"]{libsndfile} to load
mono or stereo audio data from the file @racket[p] with 16-bit signed
representation into an OpenAL buffer, @racket[b], using
@tt{alBufferData}.

}

