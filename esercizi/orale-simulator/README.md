#Orale simulator

<<<<<<< HEAD:esercizi/orale-simulator/README.md
  Script (codice brutto) che ti randomizza le domande di gorrieri. E' possibile associare ad ogni domanda una risposta, puoi personalizzarle cambiando il file risposte-gorrieri.txt. Puoi anche lanciare lo script su domande-giallorenzo.txt ma non ho scritto un file delle risposte.
=======
  Script (codice brutto) che ti randomizza le domande di Gorrieri. E' possibile associare ad ogni domanda una risposta, puoi personalizzarle cambiando il file risposteGorrieri.txt. Puoi anche lanciare lo script su domandeGiallorenzo.txt ma non ho scritto un file delle risposte.
>>>>>>> 6f91a794fc3ee92d33103e05a7e87d4b74526515:prove/orale/orale-simulator/README.md

# per eseguire

  - python3 simulator.py domande-gorrieri.txt risposte-gorrieri.txt
  - python3 simulator.py domande-giallorenzo.txt 

# comandi

  - help => options
  - c => clear prompt
  - a => answer
  - n => next question
  - p => previuos question
  - q => quit

# ma cosa fa??

  Di base legge il file in input, ogni domanda/risposta inizia con #. Per cui puo' essere riutilizzato con altri file di domande/elenchi dove ogni elemento da randomizzare inizia con #. 

