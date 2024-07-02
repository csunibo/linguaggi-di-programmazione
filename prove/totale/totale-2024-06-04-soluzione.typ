#import "@preview/finite:0.3.0": automaton

#set align(center)
= Soluzione Linguaggi Totale 
==== 2024-06-04

#set align(left)
#set par(
  justify: true
)

_NOTA: Questa è una soluzione proposta da me, non è detto che sia giusta. Se 
trovate errori segnalateli o meglio correggeteli direttamente_ :)

+ Per dimostrare che le definizioni di grammatiche libere *sono equivalenti*, 
  osserviamo che:
  - Ogni grammatica di tipo (b) è pure una grammatica di tipo (a).
  - Per ogni grammatica di tipo (a) posso trovare una equivalente grammatica
    di tipo (b). Infatti utilizzando l'algoritmo per la rimozione delle 
    produzioni $epsilon$, data $G$ di tipo (a), genero una $G'$ tale che 
    $L(G') = L(G) without {epsilon}$ e le cui produzioni non sono epsilon.
    Per ottenere una del tutto equivalente, nel caso in cui $epsilon in L(G)$,
    basta modificare $G' = (\NT, T, S, R)$ con l'aggiunta di un nuovo simbolo
    $S' -> epsilon | S$ e $G'' = (\NT union {S'}, T, S', R union 
    {S' -> epsilon, | S})$. Tale che $G''$ è di tipo (b).

+ Costruisco l'NFA più semplice che riconosce il linguaggio:
  #set align(center)
  #automaton((
    q0: (q1:"a"),
    q1: (q2:"a"),
    q2: (q3:"a"),
    q3: (q0:"a")
  ),
    initial: "q0",
    final: "q2"
  )

  #set align(left)
  Si può direi che è un DFA minimo e genera $L={a^2, a^6, a^10, dots}$ con regex
  $"aa"("aaaa")^*$ ma non è richiesto.

+ Non riescho a fare le $epsilon$ in questo pacchetto, assumete $"e" = epsilon$:
  #set align(center)
  #automaton((
    q0: (q1:"a, Z/Z"),
    q1: (q1:"a, X/aX", q2:"c, X/X"),
    q2: (q2:"b, a/e", q3:"e, X/e"),
    q3: ()
  ),
    initial: "q0",
    final: "q2"
  )

+ Per il linguaggio $L = {a^n b^n | n >= 1}$ una grammatica possibile è:
  + $S -> "ab"$
  + $S ->"aSb"$
  Costruiamo l'automa $\LR(0)$. Non so come fare stati grandi con tutti gli 
  items in typst quindi scrivo l'automa e poi definisco gli stati a parte:
  #set align(center)
  #automaton((
    q0: (q1:"S", q2: "a"),
    q1: (),
    q2: (q2:"a", q3:"b", q4: "S"),
    q3: (),
    q4: (q5:"b"),
    q5: (),
  ),
    initial: "",
    final: ""
  )
  #set align(left)
  Items:
  - q0: \
    $S' -> .S$ \
    $S-> ."ab"$ \
    $S-> ."aSb"$
  - q1: $S' -> S.$ \
  - q2: \
    $S-> "a.b"$ \
    $S-> "a.Sb"$ \
    $S-> ."ab"$ \
    $S-> ."aSb"$
  - q3: $S -> "ab."$
  - q4: $S -> "aS.b"$
  - q5: $S -> "aSb."$

  Costruiamo la tabella $\LR(0)$:
  #table(
    columns: (1fr, 1fr, 1fr, 1fr),
    align: center,
    table.header(
      [*a*], [*b*], [*\$*], [*S*]
    ),
    $0$, [S2], [], [G1],
    $1$, [], [Acc], [],
    $2$, [S2], [S3], [G4],
    $3$, [R1], [R1], [R1],
    $4$, [], [S5], [],
    $5$, [R2], [R2], [R2],
  )
  Non ci sono conflitti, quindi la grammatica è $\LR(0)$. Discutiamo il 
  comportamento del parser sugli input: \
  $(0, epsilon, "aabb$")$ \
  $(02, "a", "abb$")$ \
  $(022, "aa", "bb$")$ \
  $(0223, "aab", "b$")$ Facciamo la reduce: rimuoviamo "23" e [2, S] -> G4\
  $(024, "aS", "b$")$ \
  $(0245, "aSb", "$")$ \
  $(01, "S", "$")$ Accept!
  \\
  $(0, epsilon, "$")$  Errore, cella bianca

+ Direi che il testo è sbagliato e il passaggio dei paramentri è per nome e per
  riferimento. Per nome basta ricopiare il codice al posto della chiamata (con
  le opportune accortezze):
  ```c
  { 
    int x = 1;
    int y = 5;
    int z = 10;
    void pippo ( name int y , reference int z ){
      z = x + y + z;
    }

    { 
      int x = 20;
      int y = 30;
      int z = 50;
      //pippo (x++ , x);
      // x_ref sarebbe riferimento a x che vale 20. x_top è la x sopra la 
      // funzione pippo per scope statico.
      // In C la segunte istruzione è undefined behavior. Assumiamo che si 
      // valuti strettamente da sinistra a destra.
      x_ref = x_top + (x_ref++) + x_ref; // x_ref = 1 + 20 + 21 = 42
      //pippo (x++ , x);
      x_ref = x_top + (x_ref++) + x_ref; // x_ref = 1 + 42 + 43 = 86
      write (x); // 86
    }

    write (x); // 1
  }
  ```
  In conclusione il programma stampa *86* e *1*

+ Assumiamo che la variabile letta all'esterno sia `n`:
  ```c
  int f(int x, function g()) {
    if (x == 0) {
      g();
      return 0;
    } else {
      return f(x - 1, g()) + 1; // Evito che f possa essere tail recursive
    }
  }
  {
    void h() {
      // Codice generico
    }

    g(n, h)
  }
  ```
  L'idea è di usare `f()` per creare `n` record di attivazione e poi far chiamare 
  `h()` a `f()`.

+ È da pensare come javascript. Quindi `h({})` ritorna `{c: {e: 4}}`. Con questa
  logica `x` risulta essere: `x = {a: 1, b: {c: {e: 4}, d: {a: 5, b: {c: {a: 6 , e: 7}, d: {e: 8}}}} }`. Quindi:
  - *I1*: Errata in quanto `x` ha il campo `x.b.c` ma non contiene `b`.
  - *I2*: Errata, `x` non ha il capo `c`.
  - *I3*: Giusta
  - *I4*: Errata
  - *I5*: Giusta

+ Dal seguente programma in C++ possiamo vedere che stampa *2 3 5 7 11*:
  ```cpp
#include <exception>
#include <iostream>
#include <list>

class Z : std::exception {};

void d(int i, int n) { if (i % n == 0) throw Z(); }

void b(std::list<int> &s, int n);

class X : std::exception {};
void c(std::list<int> &s, int i, int n) {
  try { b(s, n); } catch (X) { }
  s.push_front(i); // Come add() del testo
}

void b(std::list<int> &s, int n) {
  if (s.empty()) { throw X(); }
  int i = s.front(); s.pop_front(); // Come remove() del testo
  try {
    d(i, n);
    c(s, i, n);
  } catch (Z) {
    b(s, n);
  }
}

class Y : std::exception {};
void a(std::list<int> &s) {
  if (s.empty()) {
    throw Y();
  }
  int n = s.front(); s.pop_front(); // Come remove() del testo
  
  try { b(s, n); } catch (X) { }
  try { a(s); } catch (Y) { }
  s.push_front(n); // Come add() del testo
}

int main() {
  std::list<int> l = {2, 8, 6, 3, 5, 12, 7, 11, 14, 10};
  a(l);
  for (auto &e : l) {
    std::cout << e << " ";
  }
  std::cout << std::endl;
}
  ```
  L'idea è la seguente: l'insieme delle classi partendo dal primo elemento della
  lista rimuovono tutti i multipli di quell'elemento. Quando non ci sono più
  multipli si passa all'elemento sucessivo. Durante il processo tutti gli 
  elementi vengono tolti dalla lista. Quando finalmente la lista si svuota, 
  vengono reinseriti tutti gli elementi in testa.

  La funziona `b()` è quella responsabile di rimuovere gli elementi. La funziona
  `d()` controlla se `i` è multiplo di `d` e nel caso lancia `Z` che evita che
  venga chiamata `c()` che è la funzione responsabile a "salvare" i numeri che
  poi verranno reinseriti nella lista.
