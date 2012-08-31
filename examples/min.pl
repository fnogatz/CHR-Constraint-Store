:- module(min, [min/1]).
:- use_module(library(chr)).

:- chr_constraint min/1.
min(A) \ min(B) <=> B>=A | true.
