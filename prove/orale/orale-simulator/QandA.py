# questo programma python prende in input 2 file [question, answer] 
# ogni domanda/risposta inizia con un "#"

import random
import sys
import os

class QandA: 
    question = ""
    answer = ""

def getAllRecord(fileToRead):
    doc = ""
    with open(fileToRead, "r") as file:
      doc = file.read()
    #print(doc)

    # le domande sono del formato # domanda ... fine riga
    question = []
    rec = ""
    toRec = False
    for i in range(0, len(doc)-1):
      if(doc[i] == "#"):
        question.append(rec)
        rec = ""

      if(doc[i] == "\t"):
        rec += " "
      else: 
        rec += doc[i]
      
    question.pop(0)
    return question

def main():
  if(len(sys.argv) <= 2):
    print("ERR usage: python3 QandA.py [question.txt] [answer.txt]")
    return 1
  else:
    question = getAllRecord(sys.argv[1])
    answer = getAllRecord(sys.argv[2])

    qa = []

    for i in range (0, min(len(question), len(answer))):
        qaObj = QandA()
        qaObj.question = question[i]
        qaObj.answer = answer[i]
        qa.append(qaObj)

    action = False

    while True:   
        if(not action):  
          i = random.randint(0,len(qa)-1)
        
        print(qa[i].question)

        action = False
        
        choice = input()

        if(choice == "q"): #QUIT
            break
        elif(choice == "a"): #ANSWER
            print(qa[i].answer)
            choice = input()
        elif(choice == "c"): #CLEAR
            action = True
            os.system('clear')
        elif(choice == "p" and i-1 > 0): #PREVIOUS
            action = True
            i = i - 1
            os.system('clear')
        elif(choice == "n" and i-1 > 0): #NEXT
            action = True
            i = i + 1
            os.system('clear')

        

if __name__ == '__main__':
    # This code won't run if this file is imported.
    main()
