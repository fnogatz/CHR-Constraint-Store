# CHR Constraint Store

Module to use Prolog as an incremental constraint store for Constraint Handling Rules (CHR). Since version 7.3.28 of SWI-Prolog this behaviour can also achieved using the flag `set_prolog_flag(toplevel_mode, recursive)` as described [here](https://about.chrjs.net/2016/10/01/persistent-constraint-store-in-newest-swi-prolog/).

While basic Prolog implementations support only one-time-only queries, i.e. you can't access the resulted constraint store of a previous query, this adds the functionality of an online constraint store. You can find some background information in the [Wiki](https://github.com/fnogatz/CHR-Constraint-Store/wiki/Blog-Post:-Background).

## Usage

Here is an example on how to use it:

```
:- use_module(examples/gcd).
:- use_module(examples/min).
:- use_module(examples/directions).
:- use_module(chr_store).

main :- chr_store([gcd, min, directions]).
```

Use the `chr_store` predicate to provide a list of modules which make use of CHR.

## Commands

Currently only two methods are implemented:

* `s_list`: Lists all constraints of the current constraint store.
* `s_stop`: Stops the prompt loop.

## Example

```
?- main.
[CHRstore] ?- gcd(18), north, min(3), west, east, min(1), gcd(12).
[CHRstore] ?- s_list.
[CHRstore] Stored constraints:
gcd(6)
min(1)
north
[CHRstore] ?- gcd(16), south, min(1).
[CHRstore] ?- s_list.
[CHRstore] Stored constraints:
gcd(2)
min(1)
[CHRstore] ?- s_stop.
[CHRstore] Stopped.
true .
```

## ToDo

* Delete single constraints
