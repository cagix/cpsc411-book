#!/bin/bash

exec ~/racket-v8-15/bin/racket -l cpsc411/interrogator/interrogator-cgi.rkt
# NOTE workaround some weird collection path bug by manually specifying path to Racket
#exec ~/racket-v8-15/bin/racket interrogator-cgi.rkt
