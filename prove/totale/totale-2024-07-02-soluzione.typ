#import "@preview/finite:0.3.0": automaton

#show link: underline 

#set align(center)
= Soluzione Linguaggi Totale 
==== 2024-07-02

#set align(left)
#set par(
  justify: true
)

_NOTA: Questa è una soluzione proposta da me, non è detto che sia giusta. Se 
trovate errori segnalateli o meglio correggeteli direttamente_ :)

+ Le due affermazioni sono entrambe false:
  #set enum(numbering: "a)")
  + Supponiamo che A se sia la classe dei linguaggi regolari e che B sia la 
    classe dei linguaggi liberi deterministici. Ovviamente $A subset.eq B$. Tuttavia A
    è chiusa rispetto all'unione mentre B non lo è.
  + Supponiamo che B sia la classe dei linguaggi liberi e che A sia la classe
    dei linguaggi liberi deterministici. Ovviamente $A subset.eq B$. Tuttavia B è 
    chiusa rispetto all'unione mentre A non lo è.

+  Rappresentiamo l'NFA:
  #align(
    center,
    automaton((
        q0: (q1:"a", q2: "a"),
        q1: (q3:"e", q4:"a"),
        q2: (),
        q3: (),
        q4: (q1:"a", q5:"a"),
        q5: (),
      ),
      layout: (
        q0: (-3, 0),
        q1: (0, 0),
        q2: (-3, -3),
        q3: (0, -3),
        q4: (3, 0),
        q5: (3, -3),
      ),
      style: (
        q0-q2: (curve: 0),
        q1-q3: (curve: 0),
        q4-q5: (curve: 0),
      ),
      initial: "q0",
      final: "q2, q3"
    )
  )

  Il DFA ottenuto per costruzione di sottoinsiemi:
  #align(
    center,
    automaton((
      A: (B:"a"),
      B: (C:"a"),
      C: (D:"a"),
      D: (C:"a"),
    ),
      initial: "A",
      final: "B, D"
    )
  )

  Controlliamo che sia minimo costruendo la tabella a scala:
  #let empty_cell = table.cell(
    stroke: none
  )[]
  #align(
    center,
    table(
      columns: 4,
      rows: 4,
      [*B*], [$x_0$], empty_cell, empty_cell,
      [*C*], [], [$x_0$], empty_cell,
      [*D*], [$x_0$], [], [$x_0$],
      empty_cell, [*A*], [*B*], [*C*]
    )
  )

  Costruiamo il DFA minimo $M'$:
  #align(
    center,
    automaton((
      A: (B:"a"),
      B: (A:"a"),
    ),
      initial: "A",
      final: "B"
    )
  )
  
  Il linguaggio riconosciuto è $L[M'] = {a^(2n+1) | n >= 0}$. L'espressione 
  regolare associata: $a(\aa)^*$

+ Costruiamo la tabella dei first e dei follow:
  #align(
    center,
    table(
      columns: 3,
      table.header(
        empty_cell, [*First*], [*Follow*]
      ),
      [S], [a, b, $epsilon$], [\$],
      [A], [a, $epsilon$], [b, \$],
      [B], [b, $epsilon$], [\$]
    )
  )
  #set enum(numbering: "i)")
  + Verifichiamo che la grammatica è di classe $\LL(1)$:
    #align(
      center,
      $
        - "First"(a A b) sect "First"(epsilon) = emptyset \
        {a} sect {epsilon} = emptyset \ \

        - "First"(a A b) sect "Follow"(A) = emptyset \
        {a} sect {b, \$} = emptyset \ \

        - "First"(b B) sect "First"(epsilon) = emptyset \
        {b} sect {epsilon} = emptyset \ \

        - "First"(b B) sect "Follow"(B) = emptyset \
        {b} sect {\$} = emptyset \ \
      $
    )
    $G$ è di classe $\LL(1)$ per un noto teorema visto a lezione.
  +  Costruiamo la tabella di parsing $\LL(1)$:
    #align(
      center,
      table(
        columns: 4,
        table.header(
          empty_cell, [*a*], [*b*], [*\$*]
        ),
        [$S$], [$S -> A B$], [$S -> A B$], [$S -> A B$],
        [$A$], [$A -> a A b$], [$A -> epsilon$], [$A -> epsilon$],
        [$B$], [], [$b -> b B$], [$B -> epsilon$]
      )
    )

  + Facciamo vedere il parsing sull'input: $a b b$ \
    #grid(
      columns: (auto, 1cm, auto),
      rows: 0.6cm,
      [$a b b \$$], [], [$S\$$],
      [$$], [], [$A B\$$],
      [$$], [], [$a A b B\$$],
      [$b b$], [], [$A b B\$$],
      [$$], [], [$b B\$$],
      [$b$], [], [$B\$$],
      [$b$], [], [$b B\$$],
      [$$], [], [$B\$$],
      [$$], [], [$\$$],
    )
  
    Vediamo con la stringa $epsilon$: \
    #grid(
      columns: (auto, 1cm, auto),
      rows: 0.6cm,
      [$\$$], [], [$S\$$],
      [$\$$], [], [$A B\$$],
      [$\$$], [], [$B\$$],
      [$\$$], [], [$\$$],
    )


+ Costruiamo il parser $\LR(0)$. Non so come fare stati grandi con tutti gli 
  items in typst quindi scrivo l'automa e poi definisco gli stati a parte:
  #align(
    center,
    automaton((
        q0: (q1:"S", q2: "a"),
        q1: (),
        q2: (q2:"a", q3:"S", q5:"B", q7:"b", q9:"c"),
        q3: (q4:"a"),
        q4: (),
        q5: (q6:"a"),
        q6: (),
        q7: (q7:"b", q8:"B", q9:"c"),
        q8: (),
        q9: (),
      ),
      layout: (
        q0: (-7, 0), 
        q1: (-3, 3),
        q2: (-3, 0),
        q3: (3, 2),
        q4: (5, 3),
        q5: (2, 0),
        q6: (4, 0),
        q7: (-2, -2),
        q8: (0, -2),
        q9: (-5, -2),
      ),
      initial: "",
      final: "",
      style: (
        q0-q1: (curve: 0.5),
        q2-q9: (curve: -0.5),
        q2-q7: (curve: 1.5),
        q3-q4: (curve: 0),
        q5-q6: (curve: 0),
        q7-q8: (curve: 0),
      )
    )
  )
  #table(
    columns: 2,
    align: horizon,
    [q0], [ $S' -> .S$ \ $S-> . a S a$ \ $S-> . a B a$ ],
    [q1], [$S' -> S .$],
    [q2], [$S -> a . S a $ \ $S -> a . B a$ \ $ S -> . a S a$ \ $S -> . a B a$ \
      $B -> . b B$ \ $B -> . c$],
    [q3], [$S -> a S . a$],
    [q4], [$S -> a S a .$],
    [q5], [$S -> a B . a$],
    [q6], [$S -> a B a .$],
    [q7], [$B -> b . B$ \ $B -> . b B$ \ $B -> . c$],
    [q8], [$B -> b B .$],
    [q9], [$B -> c .$]
  )

  Costruiamo la tabella $\LR(0)$ sapendo che $"Follow"(S) = {\$, a}$ e 
  $"Follow"(B) = {a}$:
  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: center,
    table.header(
      [], [*a*], [*b*], [*c*], [*\$*], [*S*], [*B*]
    ),
    $0$, [S2], [], [], [], [G1], [],
    $1$, [], [], [], [Acc], [], [],
    $2$, [S2], [S7], [S9], [], [G3], [G5],
    $3$, [S4], [], [], [], [], [],
    $4$, [R1], [], [], [R1], [], [],
    $5$, [S6], [], [], [], [], [],
    $6$, [R2], [], [], [R2], [], [],
    $7$, [], [S7], [S9], [], [], [G8],
    $8$, [R3], [], [], [], [], [],
    $9$, [R4], [], [], [], [], [],
  )

  Non essendoci conflitti $G$ è di classe SLR(1). Il Linguaggio generato da $G$ è:
  #align(
    center,
    $L(G) = {a^n b ^m c a^n | n >= 1, m >= 0}$
  )
  Questo perché $L(B) = b^* c = {b^m c | m >= 0}$ e con la produzione $S -> a B a$
  genero stringhe di tipo $a b^m c a$ e con la produzione $S -> a S a$ posso 
  aggiungere $a^k$ all'inizio e in coda con $k >= 0$.

+

+

+ Risposta:
  ```js
  ListPersona { p: Persona, next: ListPersona } + None
  ListOggetto { o: Oggetto, next: ListOggetto } + None
  Persona { name: string, figli: ListPersona, averi: ListOggetto }
  Oggetto { name: string, prop: ListPersona }

  Oggetto scudo = { name: "scudo", prop: None }
  Oggetto spada = { name: "spada", prop: None }
  Oggetto lancia = { name: "lancia", prop: None }

  Persona ares = { name: "Ares", figli: None, averi: { 
    o: scudo, next: {o: spada, next: None }}}

  Persona atena = { name: "Atena", figli: None, averi: { 
    o: scudo, next: {o: lancia, next: None }}}

  scudo.prop = { p: ares, next: { p: atena, next: None }}
  spada.prop = { p: ares, next: None }
  lancia.prop = { p: atena, next: None }

  Persona Zeus = { name: "Zeus", figli: { p: ares, next: { p: atena, next: None }}}
  ```

+ Come possiamo vedere eseguendo il codice sottostante il risultato è *2* e *42*.
  ```java
  class A {
    int i = 0;

    public A c(A a, int n) {
      if (n <= 1) { i = 1; } 
      else {
        int b = new B().c(new A(), a.i()).i;
        int c = new B().c(new A(), n - 1 - a.i()).i;
        i = i + b * c;
      }
      return this;
    }

    public int i() {
      return i;
    }
  }

  class B extends A {
    int i = 0;

    public A c(A a, int n) {
      a.c(this, n);
      if (++i < n) { c(a, n); }
      return a;
    }

    public int i() {
      return i;
    }
  }

  class esercizio {
    public static void main(String[] argv) {
      A b = new B();
      int x = 2;
      System.out.println(b.c(new A(), x).i);

      b = new B();
      x = 5;
      System.out.println(b.c(new A(), x).i);
    }
  }
  ```

  Sinceramente è un esercizio complesso e molto lungo. Giallorenzo ha dato il 
  massimo dei punti anche se si rispondeva solo il risultato di $x = 2$ e non si
  faceva $x = 5$. La soluzione che ha scritto alla lavagna è la seguente, però
  non so quanto possa essere utile:
  ```java
  c(..., 0) = 1
  c(..., 1) = 1
  c(..., 2) = 2
  i0 = 0 + 1 * 1 = 1
  i1 = 1 + 1 * 1 = 2
  c(..., 3) = 
  i0 = 0 + 1 * 2 = 2
  i1 = 2 + 1 * 1 = 3
  i2 = 3 + 2 * 1 = 5
  c(..., 4) = 
  i0 = 0 + 1 * 5 = 5
  i1 = 5 + 1 * 2 = 7
  i2 = 7 + 2 * 1 = 9
  i3 = 9 + 5 * 1 = 14
  c(..., 5) = 42
  i0 = 0 + 1 * 14 = 14
  i1 = 14 + 1 * 5 = 19
  i2 = 19 + 2 * 2 = 23
  i3 = 23 + 5 * 1 = 28
  i4 = 28 + 14 * 1 = 42
  ```
  Per i più curiosi è la seguenza di #link("https://en.wikipedia.org/wiki/Catalan_number")[Catalan]
