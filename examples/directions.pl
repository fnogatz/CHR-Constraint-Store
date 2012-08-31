:- module(directions, [north,east,south,west]).
:- use_module(library(chr)).

:- chr_constraint north, east, south, west.
north, south <=> true.
east, west <=> true.
