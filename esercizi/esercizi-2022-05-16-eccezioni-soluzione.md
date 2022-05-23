# Soluzioni degli esercizi sulle eccezioni

Maggio 2022

# Esercizio 1

Il frammento stampa 100. La eccezione viene lanciata dalla invocazione di f nel
blocco try di g, e quindi il suo gestore è quello definito dentro a g.

# Esercizio 2

Il frammento stampa 0. Le uniche istruzioni in grado di modificare valori di
variabili in questo frammento sono gli incrementi, che però agiscono solo sulla
variabile locale x, e mai su y. Quindi il valore di y non è mai modificato.

# Esercizio 3

13, 11, 12
L'x locale al blocco anonimo viene subito incrementata e diventa 11.
Quando la chiamata a foo chiama g per la prima volta, l'x globale diventa 13, e
viene subito stampato quando il controllo torna a foo in seguito al lancio
dell'eccezione.

# Esercizio 4

L'eccezione X lanciata non viene catturata dal codice del frammento perche' il
suo tipo è oscurato dalla eccezione locale omonima. Al più, un gestore
predefinito potrebbe stampare un messaggio di descrizione segnalando l'eccezione
non gestita.

# Esercizio 5

La prima eccezione è lanciata dalla invocazione a f dentro la clausola try, e
catturata subito dopo: in questo momento viene stampato "in g". Viene anche
chiamata ricorsivamente g una seconda volta, il che porta una nuova invocazione
di f, un nuovo lancio di eccezione e una nuova stampa di "in g" durante la sua
gestione. L'ultima invocazione ricorsiva di g lancia f fuori dalla clausola try,
e quindi non viene catturata in g, bensì passata al gestore di main che stampa
"in main".
