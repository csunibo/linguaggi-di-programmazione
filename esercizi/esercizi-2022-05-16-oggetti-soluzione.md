# Esercizi su tipi di dato

Maggio 2022

# Esercizio 1

N.B.: il testo contiene un refuso. "A extends B" significa che A è una
sottoclasse di B, e non viceversa.

Siccome `a.fie()` è risolta dinamicamente, viene invocata la versione definita
da `B`: è il fenomeno dello scavalcamento (o _overriding_). Il risultato è 4.

# Esercizio 2

Vengono stampati 10 e 3.
Siccome `a.f()` è risolta dinamicamente, viene invocata la versione definita
da `B`: è il fenomeno dello scavalcamento (o _overriding_). All'interno della
versione di `f` definita da `B`, la `x` in questione è il campo di `B` che
adombra l'omonimo campo di `A`. All'interno di `s3`, la `x` in questione è il
campo di `A`.

# Esercizio 3

La tabella che descrive OGG contiene:

- puntatore alla _vtable_ C;
- `A::x`;
- `C::x`.

La _vtable_ A contiene puntatori ai codici della funzione:

- `f`.

La _vtable_ B contiene puntatori ai codici delle funzioni:

- `f`;
- `g`.

La _vtable_ C contiene puntatori ai codici delle funzioni:

- `f`;
- `g`.

# Esercizio 4

La prima invocazione di metodo imposta x.b a 15.
La prima stampa produce 7 (il valore del campo B::a di x).
La seconda stampa produce 10 (il valore del campo A::a di x).
La terza stampa produce 10 (il valore del campo B::b di x).

# Esercizio 5

Per via dello scavalcamento, la versione di g chiamata da fie è quella di `B`:
il risultato è 6 + 5 = 11.

# Esercizio 6

La tabella che descrive OGG contiene:

- puntatore alla _vtable_ D;
- `A::x`;
- `B::x`;
- `C::x`.

La _vtable_ A contiene puntatori ai codici della funzione:

- `f`.

La _vtable_ B contiene puntatori ai codici delle funzioni:

- `f`.

La _vtable_ C contiene puntatori ai codici delle funzioni:

- `f`;
- `g`.

# Esercizio 7

Si veda l'esercizio 4.

# Esercizio 8

```
B
B
A
B
```

# Esercizio 9

```
0
2
```
