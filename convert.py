# Author: Connor Beardsmore <connor.beardsmore@gmail.com>
# Last Modified: 14/07/16

# This script takes the list of joyo kanji from wikipedia
# and tokenizes to the appropriate format for the widget

import sys
fin = open("kanji2.txt", 'r')
fout = open("kanji1.txt", 'w')
linenum = 1

for line in fin:
    field = line.split()
    id = field[0]
    kanji = field[1]
    meaning = field[ len(field) - 2 ]
    reading = field[ len(field) - 1 ]
    fout.write( id + " " + kanji + " " + meaning + " " + reading + "\n")

# Only require id, kanji, meaning and reading fields. Ignore others

fin.close()
fout.close()
