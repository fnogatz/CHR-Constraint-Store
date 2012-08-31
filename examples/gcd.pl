:- module(gcd, [gcd/1]).
:- use_module(library(chr)).

:- chr_constraint gcd/1.
gcd(0) <=> true.
gcd(N) \ gcd(M) <=> 0<N, N=<M | L is M mod N, gcd(L).
