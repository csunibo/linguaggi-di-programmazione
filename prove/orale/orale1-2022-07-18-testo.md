# Orale Gorrieri 2022-07-18
*Legenda*: [k] = domanda fatta k volte

- definizione di PDA [2]
- definizione DFA
	- differenza tra NFA e DFA
- come si definisce un linguaggio associato ad un linguaggio regolare?
- differenza tra un parser LL(0) e un parser SLR(1)
	- come funziona la riduzione?
- definizione di quando un simbolo è utile e quando è inutile
- quando un simbolo è raggiungibile?
- come si calcolano i simboli annullabili in una grammatica?
- cosa sono i token? a cosa si usano?
- cosa viene controllato dal parser? Se gli identificatori sono corretti?
	- "il tavolo pensa" questa frase è semanticamente, sintatticamente corretta?
		> è sintatticamente corretta 
		- differenza tra semantica e sintassi
	- semantica dei linguaggi
- definizione grammatica libera
	- quando una grammatica è libera
- definizione di first in una certa sequenza di alpha
	- come faccio a verificare se un simbolo appartiene ai follow?
- cosa dice il teorema del pumping lemma
- quando un linguaggio di dice incompleto?
	- cosa dice la tesi di %%
- come si fa ad associare ad una espressione regolare un particolare NFA
- cosa fa l'analisi semantica in un calcolatore?
	- che tipi di check fa?
	- quando si scrive un identificatore, sbagliando mettiamo qualcosa che genera errore. Cosa fa l'analisi sintattica? Di cosa si accorge?
	- cosa identifica l'analisi semantica?
- definizione di PDA [2]
	- cosa fa un PDA?
	- qualè la sua funzione?
	- può essere un parser top-down un tipo di PDA?
		> sì
- un linguaggio regolare, è sicuramente di classe LR(0)?
	> no 
	- perchè?
- se esistono dei linguaggi liberi det che non sono LR(k)?
	> sì
	- perchè?
	> quando classifichiamo i linguaggi, abbiamo vito che i linguaggi liberi deterministici corrispondono con i linguaggi LR(0)
- quando una grammatica è ambigua?
	- verifica se due grammatiche sono semanticamente diverse
- preso un PDA, il linguaggio che riconosce la pila vuota e %% è lo stesso?
	> sì - perchè . . .
- quali sono le proprietà di chiusura dei linguaggi liberi?
	- se L1 e L2 sono liberi, allora la loro intersezione... e la stella di Kleene tra i due?
- il problema di equivalenza tra linguaggi regolari?
- il problema id equivalenza tra grammatiche libere e PDA?
- cosa sono i simboli inutili?
- una volta che ho eliminato i simboli inutili, una grammatica è ancora ambigua?
- posso sempre disambiguare una grammatica?
- cos'è LEX? [2]
- tecniche top-down bottom-up a cosa si riferiscono?
- Cos'è una macchina astratta?
- un linguaggio regolare è sempre di classe LL(1)?
- le macchine software come vengono implementate?
- parla del pumping theoreme
- ci sono _linguaggi_ che sono di classe LR(1) e che non sono SLR(1)?
