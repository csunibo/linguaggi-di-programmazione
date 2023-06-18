# Orale simulator

  Script (codice brutto) che ti randomizza le domande di Gorrieri. E' possibile associare ad ogni domanda una risposta, puoi personalizzarle cambiando il file risposteGorrieri.txt. Puoi anche lanciare lo script su domandeGiallorenzo.txt ma non ho scritto un file delle risposte.

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

