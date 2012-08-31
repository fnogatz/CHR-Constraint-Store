:- module(chr_store, [chr_store/1]).
:- use_module(chr(chr_runtime)).

%% Do not print constraint store on s_stop.
:- set_prolog_flag(chr_toplevel_show_store,false).

chr_store(ModList) :- asserta(mod_list(ModList)), prompt.

prompt :- write('[CHRstore] ?- '),
                read(Query),
                callq(Query).

% see http://www.swi-prolog.org/pldoc/man?predicate=chr_show_store%2f1
show_constraint_stores :- mod_list(ModList), 
                show_constraint_stores(ModList).
show_constraint_stores([Mod|ModList]) :- 
                chr_show_store(Mod),
                show_constraint_stores(ModList).
show_constraint_stores(_).

%% Definining constraint store methods
callq(s_list) :- writeln('[CHRstore] Stored constraints:'),
                show_constraint_stores,
                prompt.
callq(s_stop) :- writeln('[CHRstore] Stopped.').

callq(Query) :- call(Query),
                prompt.
callq(_) :- write('[CHRstore] Query execution failed.'),
                prompt.
