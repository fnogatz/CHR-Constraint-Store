# CHR Constraint Store

Module to use Prolog as an incremental constraint store for Constraint Handling Rules (CHR). While basic Prolog implementations support only one time only queries, i.e. you can't access the resulted constraint store of a previous query, this adds the functionality of an online constraint store.

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

## ToDo

* Delete single constraints
