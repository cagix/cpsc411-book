#lang reader "assignment-lang.rkt"
@(require
  racket/function
  cpsc411/compiler-lib
  cpsc411/langs/v8
  (for-label
   (except-in cpsc411/reference/a8-solution
              ;; not documented
              check-exprs-lang
              uncover-locals
              undead-analysis
              conflict-analysis
              assign-call-undead-variables
              allocate-frames
              assign-registers
              assign-frame-variables
              replace-locations
              optimize-predicates
              implement-fvars
              expose-basic-blocks
              resolve-predicates
              flatten-program)))

@(reset-exercise-counter!)
@(reset-challenge-counter!)

@title[#:tag "top" #:tag-prefix "a8:"]{Milestone 8: Structured Data Types}

@section{Assignment Summary}

The goal of this assignment is to introduce memory allocation and structured
data.
We will add cons pairs and vectors.
We will extend our tagged object representation to distinguish these data
types dynamically.

This assignment is due @(due 'a8).

You can use the interrogator to get limited access to the reference solution:
@url{https://www.students.cs.ubc.ca/~cs-411/@|semester|/interrogator.cgi?an=a8}.

@todo{Explicit learning objectives}

@subsubsub*section{Checklist}

@emph{Completely new passes}
@itemlist[
@item{@racket[implement-mops]}
@item{@racket[expose-allocation-pointer]}
]

@emph{Major modifications to passes}
@itemlist[
@item{@racket[implement-safe-primops]
(or at least significant changes to the safe wrapper specification)}
@item{@racket[specify-representation]}
@item{@racket[sequentialize-let]}
@item{@racket[patch-instructions]}
]

@emph{Minor modifications to passes}
@itemlist[
@item{@racket[check-exprs-lang]}
@item{@racket[uniquify]}
@item{@racket[remove-complex-opera*]}
@item{@racket[impose-calling-conventions]}
@item{@racket[normalize-bind]}
@item{@racket[select-instructions]}
@item{@racket[uncover-locals]}
@item{@racket[conflict-analysis]}
@item{@racket[replace-locations]}
@item{@racket[optimize-predicates]}
@item{@racket[implement-fvars]}
@item{@racket[generate-x64]}
]

@emph{No modifications required (depending on design)}
@itemlist[
@item{@racket[assign-call-undead-variables]}
@item{@racket[allocate-frames]}
@item{@racket[assign-registers]}
@item{@racket[assign-frame-variables]}
@item{@racket[expose-basic-blocks]}
@item{@racket[resolve-predicates]}
@item{@racket[flatten-program]}
]

@section{Reading}
The reading for this week is @Secref[#:tag-prefixes '("book:"
"chp-structured-data:")]{top}.
As usual, this milestone description links to the documentation for each
exercise in the chapter for convenience, but you are responsible for the
reading the entire chapter.

@section{Exercises}

@exercise[#:optional #t]{Redesign and extend the implementation of @code{check-exprs-lang}.}

@exercise{Redesign and extend the implementation of @racket[uniquify].}

@exercise{Redesign and extend the implementation of @racket[implement-safe-primops].

Now that there are now more combinations of @object-code{primop}s and arguments
than are possible to encode in a single number.
You'll need to give up some precision in error numbers.}

@exercise{Redesign and extend the implementation of the function
@racket[specify-representation].

Remember to not use constant values and instead use parameters.
Some values may change.

Remember that the input language uses fixnum @ch7-tech{ptrs} for all inputs, but the
output uses bytes for @ch8-tech{mops}.
}

@exercise{Redesign and extend the implementation of @racket[remove-complex-opera*].}

@exercise{Redesign and extend the implementation of @racket[sequentialize-let].}

@exercise{Redesign and extend the implementation @racket[normalize-bind].

You may want to use a continuation in the helper for transforming values, if
you're not already.
This will make adding support for @imp-mf-lang-v8[mset!] a ~1-line addition.}

@exercise{Redesign and extend the implementation of @racket[impose-calling-conventions].}

@exercise{Redesign and extend the implementation of @racket[select-instructions].}

@exercise{Design and implement the function @racket[expose-allocation-pointer].}

@exercise{Redesign and extend the implementation of
@itemlist[
@item{@racket[uncover-locals], should require minor changes.}
@item{@racket[undead-analysis], should require minor changes.
Note that @ch8-tech{mops} do not @emph{assign} any registers or frame variables.}
@item{@racket[conflict-analysis], should require minor changes.
Note that @ch8-tech{mops} do not @emph{assign} any registers or frame variables.}
@item{@racket[assign-call-undead-variables], should require no changes.}
@item{@racket[allocate-frames], should require no changes.}
@item{@racket[assign-registers], should require no changes.}
@item{@racket[assign-frame-variables], should require no changes.}
@item{@racket[replace-locations], should require minor changes to support
@ch8-tech{mops}.}
@item{@racket[optimize-predicates], could require minor changes.}
@item{@racket[implement-fvars], should require minor changes to support
@ch8-tech{mops}.
Note that we assume the @para-asm-lang-v8[fbp] is not modified by
@ch8-tech{mops}.}
@item{@racket[expose-basic-blocks], should require no changes}
@item{@racket[resolve-predicates], should require no changes}
@item{@racket[flatten-program], should require no changes}
]}


@exercise{Redesign and extend the implementation of @racket[patch-instructions].

You only need to add two cases, and you can write them very systematically, but
they will take care to get right and cover all combinations.
}


@exercise{Design and implement @racket[implement-mops].
This should be a very simple compiler.
}

@exercise{Redesign and extend the implementation of @racket[generate-x64] to
support index-mode operands.

This could be a one-line change depending on the design of your compiler.
}
