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
