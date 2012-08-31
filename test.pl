:- use_module(examples/gcd).
:- use_module(examples/min).
:- use_module(examples/directions).
:- use_module(chr_store).

main :- chr_store([gcd, min, directions]).
