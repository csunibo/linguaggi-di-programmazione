# Domande Gabrielli

1. Come funziona l'invocazione dinamica di un metodo? Come avviene l'invocazione Object-oriented?
    
    una sottoclasse può ridefinire un’implementazione di un metodo, ed al momento dell’esecuzione, il codice eseguito dipende dal tipo di oggetto che riceve il messaggio, ed è dinamico in quanto ne conosciamo il tipo solo a runtime
    
    a lezione abbiamo visto come una delle implementazioni più diffuse per gestire l’invocazione Object-oriented sia quello delle Vtable, che lega ogni oggetto esistente di una classe alla sua Vtable corrispondente, fornendo così accessi statici a tutti i metodi della classe per ogni oggetto
    
2. Definizione di ambiente
    
    insieme di associazioni di nomi esistenti durante un run-time, in un tempo e spazio specifico (in un punto del programma specifico e in un certo momento dell’esecuzione)
    
3. come sono memorizzati gli array? cos’è il dope vector?
    
    un array è un puntatore ad una cella di memoria che contiene il tipo di dato indicato, mentre le celle successive contengono le altre istanze del dato allocato, fino alla sua dimensione.
    
    il dope vector è una struttura dati che contiene informazioni su una struttura dati, e vengono usati soprattutto per descrivere gli array
    
4. Cos’è la ricorsione in coda?
    
    La ricorsione della coda è un caso speciale di ricorsione in cui la funzione chiamante non esegue più il calcolo dopo aver effettuato una chiamata ricorsiva, effettivamente quando la chiamata ricorsiva è l’ultima istruzione del sottoprogramma.
    
    Ciò significa che non abbiamo bisogno di uno stack di chiamate per tutte le chiamate ricorsive e possiamo implementare la chiamata finale come un semplice salto, che ci fa risparmiare spazio.
    
5. quando una funzione restituisce un’altra funzione come parametro?
    
    
6. differenza tra parte pubblica e parte privata
    
    sono due encapsulazioni delle classi, la parte pubblica è la parte della classe, sia metodi che parametri, richiamabili e utilizzabile esternamente in tutto il progetto, mentre la parte privata è richiamabile e modificata solo dalla classe stessa
    
7. Scope statico implementato con catena statica come funziona? E scope dinamico con catena dinamica? Quali sono svantaggi e vantaggi?
    
    quando il programma ha bisogno di prendere una variabile non locale, nel caso della catena statica, si risale attraverso il link statico contenuto nel record di attivazione finché non si trova la variabile di cui siamo in cerca, mentre nello scope dinamico viene invece si risale attraverso il link dinamico, che punta all’RdA precedentemente attivato
    
    la catena statica è più difficile da implementare ma più leggibile e intuitiva, mentre la catena dinamica è più leggera da implementare, ma meno leggibile dal codice dato che alcuni legami sono fatti a runtime
    
8. come determino il contatore di catena statica?
    
    staticamente si determina il k e poi il nuovo puntatore di catena statica è ottenuto risalendo per esattamente k passi il puntatore di catena statica del chiamante.
    
    k è un dato intermedio calcolato staticamente e attribuito ad ogni chiamata
    
    è 0 se la procedura chiamata è locale, 1 se definita nel primo blocco che contiene sintatticamente il blocco chiamante, 2 se nel secondo blocco che contiene sintatticamente il blocco chiamante, etc…
    
9. nei linguaggi funzionali ci sono comandi?
    
    no, solo espressioni
    
10. differenza tra espressione e comando
    
    un’espressione è un’entità sintattica che se valutato produce un valore oppure non termina (espressione indefinita)
    
    un comando è un’entità sintattica che non necessariamente restituisce un valore, ma può avere un effetto collaterale (una modifica dello stato della computazione)
    
11. cos’è un sottotipo? ereitarietà e sottotipi in java
    
    il sottotipaggio è una forma di polimorfismo che associa un tipo di dato ad un altro, più specifico ed utilizzabile in ogni contesto in cui il supertipo andrebbe utilizzato (esempio animale e cane)
    
    l’ereditarietà in java
    
    chiamiamo una sottoclasse di una generica classe Estensione di quella classe, essa eredita i campi e i metodi della classe padre, ed ha la possibilità di aggiungerli o sovrascriverli (overriding)
    
12.  cos’è il passaggio per riferimento e come funziona?
    
    è un tipo di passaggio parametrico dove viene passata l’indirizzo di memoria della variabile in questione, e di conseguenza qualsiasi cambiamento al valore avviene al momento dell’istruzione, a differenza di un passaggio a valore per esempio, che non modifica la variabile originale
    
13. differenza tra iterazione determinata e indeterminata
    
    è determinata quando conosciamo il numero di iterazioni che avvengono prima della fase di runtime (ad esempio un for i  0 → 10) mentre è indeterminata quando non è determinabile se non in fase di runtime ( while )
    
14. cos’è un blocco?
    
    **Blocco:** regione testuale del programma con inizio e fine che contiene dichiarazioni locali
    
15. differenza tra scope statico e dinamico (e qual è il loro potere espressivo)
    
    con scope statico, l’associazione nomi-oggetti dipende dalla loro posizione nel blocco del programma
    
    Con scope dinamico l’associazione nomi-oggetti denotabili dipende
    
    - dal flusso del controllo a run-time
    - dall’ordine con cui i sottoprogrammi sono chiamati
16. cos’è il tipo void
    
    simile al tipo unità, è usato in moltissimi linguaggi per indicare un tipo di funzione che non ritorna un valore al suo chiamante
    
17. metodi per implementare l’ereditarietà
    - lista concatenata, dove ogni sottoclasse punta alla lista della sua superclasse
    - late self binding, che usa la struttura statica dell’oggetto per evitare di caricare inutilmente lo stack per accedere alle reference della classe
    - single inheritance, che implementa le Vtable
    
    strutture dati che contengono le funzioni di una classe e vengono associate tramite un puntatore ad ogni oggetto della classe che rappresentano (implementazione vantaggiosa in termini di memoria)
    
18. quali sono i comandi condizionali? vantaggi tra if e switch
    
    comandi che impongono una condizione per eseguire un blocco preciso che specificano, un esempio di questi comandi sono If e switch
    
    con i case dello switch abbiamo del codice più chiaro e veloce da scrivere, nessuna condizione di uguaglianza da verificare, codice più leggibile
    
19. cos’è il CRT e a cosa serve?
    
    una tabella che mantiene tutti i nomi distinti del programma, ed ad ogni nome è associata una lista di associazioni di quel nome
    
    ha tempi di accesso costanti
    
20. Garbage collection: come funzionano i contatori dei riferimenti?
    
    si associa ad ogni oggetto un contatore che tiene traccia del numero di puntatori da cui è puntata.
    
    a 0 contatori, l’oggetto è considerato garbage
    
21. posso implementare la comunicazione sincrona con l'asincrona?


- se ci sono errori, la colpa è di Luizo <3
