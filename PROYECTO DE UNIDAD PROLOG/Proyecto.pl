:- dynamic(grupo/2).

grupo(segundo, [alicia, maria]).
grupo(cuarto, [jalil, yolanda]).
grupo(sexto, [eduardo, joan]).

eliminar :- write('Nombre: '), read(Nombre),
    retract(grupo(Nombre, _)), !.
eliminar :- write('No existe el grupo \n').

borrar :- abolish(grupo/2),
    write('Se han borrado todos los grupos \n').


adicionar :- write('Nombre: '), read(Nombre),
    write('Cantidad de alumnos: '),
    read(Cant), crearAlumnos(Cant,F),
    Fam = grupo(Nombre, F),
    asserta(Fam).

crearAlumnos(0,[]) :- !, true.
crearAlumnos(C,[Hijo|L]) :- read(Hijo), Ctemp is C - 1, crearAlumnos(Ctemp,L).

menu :- write('*** Gestor de grupos de alumnos *** \n'),
write('1. Insertar un grupo'),nl,
write('2. Eliminar un grupo'), nl,
write('3. Borrar todos los grupos'), nl,
write('4. Lista de todos los alumnos'), nl,
write('Seleccione una opci?n (cero para salir): '), read(Opcion),
    ejecutar(Opcion).

ejecutar(Opcion) :- Opcion == 1, adicionar, menu;
Opcion == 2, eliminar, menu;
Opcion == 3, borrar, menu;
Opcion == 4, listar, menu;
Opcion == 0, true.

listar :- setof(C, (P,H)^(grupo(P,H), member(C,H)), L), write(L),nl.
